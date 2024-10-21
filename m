Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F539A6B0D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 15:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D8B10E50F;
	Mon, 21 Oct 2024 13:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T11wMjFt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3A910E510
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 13:52:11 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5c962c3e97dso5407085a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729518730; x=1730123530; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WGeL/CMLQop9L2aOH26yIjOa9CjW+8emQ3skOBpUpHQ=;
 b=T11wMjFtlVlyHp5LlE1EiV7ZBLMP5iNeI+Qgqsb1BoPr8OX36yrze7tXmhaZOkm+Z8
 BkN+9hTFAmXfY8rODGgdxs7jFVswsA9AQrQ2dqDz4F5fGlXt1q2lBLch3oNiqM/8IBcy
 Oxk+30CcRZYcAcO0YBfwDKahMWj9USoQDzdlUMdr02rKDCid2ixFVa5gQnAvPI7t2g8Y
 Ee97uuWdOamq5f/6H/JId9nTJcNCe4IiRr9R5kPZBnsalYTT9UnQylit3R3LWZS9O4Y2
 2zYs6ZO8RoTbHUu4LaW/0xW2zpRaC6sm93tT7/sor0dKPHdOKWRo9l0Te81PGq0sgN5M
 bi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729518730; x=1730123530;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WGeL/CMLQop9L2aOH26yIjOa9CjW+8emQ3skOBpUpHQ=;
 b=j9WkfWCmq2IDP2ZlO6Ce6KLZI09q+TEFxOO/WMMpbA61Ya7U7Rm0bSeNj1E3WeeoXk
 /OKbOuvGjM0aT8tqHBXmhKQVOvXkUDhooGZVpVZEt/3c8bKf/92e77FKrF3kHniCPBJY
 hsqgpzehTTaQMchkkJRXQ7YmP3ARodhKHRpFIWk8xSuplQmJD+VcNNR6whQwIWaLWl6Q
 aO+i4qHFWR9mgKinXw+IVb0B0JQuGE01QKsZT8jeyb0Y0zK0HXl0eWJhaalTQ4b470Wg
 w5kSSrRneTzWTt+gKHM7YXA4CoTOd6Mrq1WONWUqTPbWXjgWknDd9EPXBEWV6IO/TKMU
 mRkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1/sqWuBrF+PakjqzvUC/jozglrIBfiGBvnyet3I7sskj1WGn0TbVRWd4GCP5FmMT5zm2FDBBsmCQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUbjAUeLyUlIQDW+Ora7WXhP4MT5/wwWUyIbnXbR3v+6zG70c8
 f127M3e5qJshHvLjGNI8/GdtxFYyGFN+ruxpq+5JNgFsJKu6nuThCE3RbvYDj0PRsKsRzJ60DU1
 3NW6SGgQYuvUymFgRFA6tjfeF+1I=
X-Google-Smtp-Source: AGHT+IG8YhpQsAqwyZSP89Tw+0wRBO5Bgw/ljOxfS7/Pfo8btVfvOSsdL+NHtFF+Lom91E2wgUPS0YgSu2U2n86kc0k=
X-Received: by 2002:a17:907:8f08:b0:a9a:6bc2:c0a3 with SMTP id
 a640c23a62f3a-a9a6bc2c0ecmr789146166b.7.1729518729497; Mon, 21 Oct 2024
 06:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20241011152929.10145-1-vamsikrishna.brahmajosyula@gmail.com>
 <87jze1y3mb.fsf@intel.com>
In-Reply-To: <87jze1y3mb.fsf@intel.com>
From: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
Date: Mon, 21 Oct 2024 19:21:58 +0530
Message-ID: <CAJvTgAjb1h=1vn3MVNbTu=qrxf2zaG1RgF4jTM3uobTfpd9YRw@mail.gmail.com>
Subject: Re: [PATCH] drm/edid: transition to passing struct cea_db * to
 cae_db_payload_len
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, skhan@linuxfoundation.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 21, 2024 at 7:12=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Fri, 11 Oct 2024, Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosy=
ula@gmail.com> wrote:
> > Address the FIXME in cea_db_payload_len
> >       Transition to passing struct cea_db * everywhere
>
> You've misunderstood the comment. The point is to pass struct cea_db *
> around, not to stick to u8 * and drop calls to cea_db_payload_len().
>
Thank you for the response.
Would below be an acceptable change for the FIXME?
1. Use a macro to extract length from  (db->tag_length & 0x1f)
2. Pass struct cea_db * to all individual parsers
3. Use db->data? / convert to u8 and use db[i] where needed.

> BR,
> Jani.
>
> >
> > Precompute the payload length in drm_parse_cea_ext and pass to
> > individual parsers to avoid casting struct cea_db pointer to u8
> > pointer where length is needed.
> >
> > Since the type of payload length is inconsistent in the file,
> > use u8, u16 where it was already in place, use int elsewhere.
> >
> > Signed-off-by: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@=
gmail.com>
> > ---
> >  drivers/gpu/drm/drm_edid.c | 63 ++++++++++++++++----------------------
> >  1 file changed, 27 insertions(+), 36 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 855beafb76ff..80442e8b8ac6 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -4977,11 +4977,8 @@ static int cea_db_tag(const struct cea_db *db)
> >       return db->tag_length >> 5;
> >  }
> >
> > -static int cea_db_payload_len(const void *_db)
> > +static int cea_db_payload_len(const struct cea_db *db)
> >  {
> > -     /* FIXME: Transition to passing struct cea_db * everywhere. */
> > -     const struct cea_db *db =3D _db;
> > -
> >       return db->tag_length & 0x1f;
> >  }
> >
> > @@ -5432,22 +5429,18 @@ static uint8_t hdr_metadata_type(const u8 *edid=
_ext)
> >  }
> >
> >  static void
> > -drm_parse_hdr_metadata_block(struct drm_connector *connector, const u8=
 *db)
> > +drm_parse_hdr_metadata_block(struct drm_connector *connector, const u8=
 *db, const u16 payload_len)
> >  {
> > -     u16 len;
> > -
> > -     len =3D cea_db_payload_len(db);
> > -
> >       connector->hdr_sink_metadata.hdmi_type1.eotf =3D
> >                                               eotf_supported(db);
> >       connector->hdr_sink_metadata.hdmi_type1.metadata_type =3D
> >                                               hdr_metadata_type(db);
> >
> > -     if (len >=3D 4)
> > +     if (payload_len >=3D 4)
> >               connector->hdr_sink_metadata.hdmi_type1.max_cll =3D db[4]=
;
> > -     if (len >=3D 5)
> > +     if (payload_len >=3D 5)
> >               connector->hdr_sink_metadata.hdmi_type1.max_fall =3D db[5=
];
> > -     if (len >=3D 6) {
> > +     if (payload_len >=3D 6) {
> >               connector->hdr_sink_metadata.hdmi_type1.min_cll =3D db[6]=
;
> >
> >               /* Calculate only when all values are available */
> > @@ -5457,20 +5450,18 @@ drm_parse_hdr_metadata_block(struct drm_connect=
or *connector, const u8 *db)
> >
> >  /* HDMI Vendor-Specific Data Block (HDMI VSDB, H14b-VSDB) */
> >  static void
> > -drm_parse_hdmi_vsdb_audio(struct drm_connector *connector, const u8 *d=
b)
> > +drm_parse_hdmi_vsdb_audio(struct drm_connector *connector, const u8 *d=
b, u8 payload_len)
> >  {
> > -     u8 len =3D cea_db_payload_len(db);
> > -
> > -     if (len >=3D 6 && (db[6] & (1 << 7)))
> > +     if (payload_len >=3D 6 && (db[6] & (1 << 7)))
> >               connector->eld[DRM_ELD_SAD_COUNT_CONN_TYPE] |=3D DRM_ELD_=
SUPPORTS_AI;
> >
> > -     if (len >=3D 10 && hdmi_vsdb_latency_present(db)) {
> > +     if (payload_len >=3D 10 && hdmi_vsdb_latency_present(db)) {
> >               connector->latency_present[0] =3D true;
> >               connector->video_latency[0] =3D db[9];
> >               connector->audio_latency[0] =3D db[10];
> >       }
> >
> > -     if (len >=3D 12 && hdmi_vsdb_i_latency_present(db)) {
> > +     if (payload_len >=3D 12 && hdmi_vsdb_i_latency_present(db)) {
> >               connector->latency_present[1] =3D true;
> >               connector->video_latency[1] =3D db[11];
> >               connector->audio_latency[1] =3D db[12];
> > @@ -5695,7 +5686,7 @@ static void drm_edid_to_eld(struct drm_connector =
*connector,
> >               case CTA_DB_VENDOR:
> >                       /* HDMI Vendor-Specific Data Block */
> >                       if (cea_db_is_hdmi_vsdb(db))
> > -                             drm_parse_hdmi_vsdb_audio(connector, (con=
st u8 *)db);
> > +                             drm_parse_hdmi_vsdb_audio(connector, (con=
st u8 *)db, len);
> >                       break;
> >               default:
> >                       break;
> > @@ -6122,7 +6113,7 @@ static void drm_parse_ycbcr420_deep_color_info(st=
ruct drm_connector *connector,
> >  }
> >
> >  static void drm_parse_dsc_info(struct drm_hdmi_dsc_cap *hdmi_dsc,
> > -                            const u8 *hf_scds)
> > +                            const u8 *hf_scds, int payload_len)
> >  {
> >       hdmi_dsc->v_1p2 =3D hf_scds[11] & DRM_EDID_DSC_1P2;
> >
> > @@ -6142,7 +6133,7 @@ static void drm_parse_dsc_info(struct drm_hdmi_ds=
c_cap *hdmi_dsc,
> >               /* Supports min 8 BPC if DSC 1.2 is supported*/
> >               hdmi_dsc->bpc_supported =3D 8;
> >
> > -     if (cea_db_payload_len(hf_scds) >=3D 12 && hf_scds[12]) {
> > +     if (payload_len >=3D 12 && hf_scds[12]) {
> >               u8 dsc_max_slices;
> >               u8 dsc_max_frl_rate;
> >
> > @@ -6188,13 +6179,13 @@ static void drm_parse_dsc_info(struct drm_hdmi_=
dsc_cap *hdmi_dsc,
> >               }
> >       }
> >
> > -     if (cea_db_payload_len(hf_scds) >=3D 13 && hf_scds[13])
> > +     if (payload_len >=3D 13 && hf_scds[13])
> >               hdmi_dsc->total_chunk_kbytes =3D hf_scds[13] & DRM_EDID_D=
SC_TOTAL_CHUNK_KBYTES;
> >  }
> >
> >  /* Sink Capability Data Structure */
> >  static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
> > -                                   const u8 *hf_scds)
> > +                                   const u8 *hf_scds, int payload_len)
> >  {
> >       struct drm_display_info *info =3D &connector->display_info;
> >       struct drm_hdmi_info *hdmi =3D &info->hdmi;
> > @@ -6247,8 +6238,8 @@ static void drm_parse_hdmi_forum_scds(struct drm_=
connector *connector,
> >
> >       drm_parse_ycbcr420_deep_color_info(connector, hf_scds);
> >
> > -     if (cea_db_payload_len(hf_scds) >=3D 11 && hf_scds[11]) {
> > -             drm_parse_dsc_info(hdmi_dsc, hf_scds);
> > +     if (payload_len >=3D 11 && hf_scds[11]) {
> > +             drm_parse_dsc_info(hdmi_dsc, hf_scds, payload_len);
> >               dsc_support =3D true;
> >       }
> >
> > @@ -6259,7 +6250,7 @@ static void drm_parse_hdmi_forum_scds(struct drm_=
connector *connector,
> >  }
> >
> >  static void drm_parse_hdmi_deep_color_info(struct drm_connector *conne=
ctor,
> > -                                        const u8 *hdmi)
> > +                                        const u8 *hdmi, const u8 paylo=
ad_len)
> >  {
> >       struct drm_display_info *info =3D &connector->display_info;
> >       unsigned int dc_bpc =3D 0;
> > @@ -6267,7 +6258,7 @@ static void drm_parse_hdmi_deep_color_info(struct=
 drm_connector *connector,
> >       /* HDMI supports at least 8 bpc */
> >       info->bpc =3D 8;
> >
> > -     if (cea_db_payload_len(hdmi) < 6)
> > +     if (payload_len < 6)
> >               return;
> >
> >       if (hdmi[6] & DRM_EDID_HDMI_DC_30) {
> > @@ -6320,18 +6311,17 @@ static void drm_parse_hdmi_deep_color_info(stru=
ct drm_connector *connector,
> >
> >  /* HDMI Vendor-Specific Data Block (HDMI VSDB, H14b-VSDB) */
> >  static void
> > -drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *d=
b)
> > +drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *d=
b, const u8 payload_len)
> >  {
> >       struct drm_display_info *info =3D &connector->display_info;
> > -     u8 len =3D cea_db_payload_len(db);
> >
> >       info->is_hdmi =3D true;
> >
> >       info->source_physical_address =3D (db[4] << 8) | db[5];
> >
> > -     if (len >=3D 6)
> > +     if (payload_len >=3D 6)
> >               info->dvi_dual =3D db[6] & 1;
> > -     if (len >=3D 7)
> > +     if (payload_len >=3D 7)
> >               info->max_tmds_clock =3D db[7] * 5000;
> >
> >       /*
> > @@ -6340,14 +6330,14 @@ drm_parse_hdmi_vsdb_video(struct drm_connector =
*connector, const u8 *db)
> >        * HDMI infoframe support was first added in HDMI 1.4. Assume the=
 sink
> >        * supports infoframes if HDMI_Video_present is set.
> >        */
> > -     if (len >=3D 8 && db[8] & BIT(5))
> > +     if (payload_len >=3D 8 && db[8] & BIT(5))
> >               info->has_hdmi_infoframe =3D true;
> >
> >       drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI: DVI dual %d,=
 max TMDS clock %d kHz\n",
> >                   connector->base.id, connector->name,
> >                   info->dvi_dual, info->max_tmds_clock);
> >
> > -     drm_parse_hdmi_deep_color_info(connector, db);
> > +     drm_parse_hdmi_deep_color_info(connector, db, payload_len);
> >  }
> >
> >  /*
> > @@ -6410,12 +6400,13 @@ static void drm_parse_cea_ext(struct drm_connec=
tor *connector,
> >       cea_db_iter_for_each(db, &iter) {
> >               /* FIXME: convert parsers to use struct cea_db */
> >               const u8 *data =3D (const u8 *)db;
> > +             int len =3D cea_db_payload_len(db);
> >
> >               if (cea_db_is_hdmi_vsdb(db))
> > -                     drm_parse_hdmi_vsdb_video(connector, data);
> > +                     drm_parse_hdmi_vsdb_video(connector, data, len);
> >               else if (cea_db_is_hdmi_forum_vsdb(db) ||
> >                        cea_db_is_hdmi_forum_scdb(db))
> > -                     drm_parse_hdmi_forum_scds(connector, data);
> > +                     drm_parse_hdmi_forum_scds(connector, data, len);
> >               else if (cea_db_is_microsoft_vsdb(db))
> >                       drm_parse_microsoft_vsdb(connector, data);
> >               else if (cea_db_is_y420cmdb(db))
> > @@ -6425,7 +6416,7 @@ static void drm_parse_cea_ext(struct drm_connecto=
r *connector,
> >               else if (cea_db_is_vcdb(db))
> >                       drm_parse_vcdb(connector, data);
> >               else if (cea_db_is_hdmi_hdr_metadata_block(db))
> > -                     drm_parse_hdr_metadata_block(connector, data);
> > +                     drm_parse_hdr_metadata_block(connector, data, len=
);
> >               else if (cea_db_tag(db) =3D=3D CTA_DB_VIDEO)
> >                       parse_cta_vdb(connector, db);
> >               else if (cea_db_tag(db) =3D=3D CTA_DB_AUDIO)
> >
> > base-commit: 1d227fcc72223cbdd34d0ce13541cbaab5e0d72f
>
> --
> Jani Nikula, Intel
Thanks,
Vamsi
