Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C14962985
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 15:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27EBE10E532;
	Wed, 28 Aug 2024 13:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AgDmJOtQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F5D10E531;
 Wed, 28 Aug 2024 13:59:07 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-71420e66ecfso447552b3a.0; 
 Wed, 28 Aug 2024 06:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724853547; x=1725458347; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j17SgWpk5R0r6pUXYRNRmemGHlGjHxXJNZcaBt+9vjk=;
 b=AgDmJOtQ0fSwII45zSkr9QNmdbbJflgCr3InxvR59dNK8MohwE7fYqcpTWD4eoKetz
 eF84kLsk3AdJUV6dIJ5aClqsK4Q91jAs4Z4hL95z6sB6vvHqaK4EmqDJIxUrrkevAvo/
 LKBWQQVUcVTVCudGb9QBnabxilWMOeiSmjwc7R0FvM/Sx+AutLHzg9g48hQw57FtbW8f
 wvfaZDUR/ID++j0P0d9/12OIk6rlIFvpNpETvDaqXb3o2aVx0djdmB2oxcoEFesukGt+
 iXOOxg04LWU8ic3M4qQoLpY9tfQ9TU8ll77/gbasyWx/l1/oh6+Ay1QeJX5pPwVKR/ND
 Bisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724853547; x=1725458347;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j17SgWpk5R0r6pUXYRNRmemGHlGjHxXJNZcaBt+9vjk=;
 b=a5dNYkGWNNMXe6hGJX88M+73ydXtP750wzIj0IUyEKjRLWkkZE9ECsRQZD1FPd1aip
 0y55EtgbqqpIMwfDUP9ewCK39shuAkikHu88u/ahpsM/G7FCcjGc5buibaZfIZmJA30M
 opTBcGsV6QlAc4m6+jMvMaijxUT965/ry5pP42WCU53V+4SOEb2T4KJbNw+NDDrXErpx
 hm/GcDAOULTOwFUUA6NFKmjMAIBsuneI/1092wobd+ZpUYN6J2CPYwp7RvdfPXCzmOmN
 AuI7lxOmy32hLpPXH9V69JyCiP8BYMsvynyxaROg+h1Fqk8JvEZEwhqLKcRq1v1XzH7a
 U5lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9okRt607nDZ0E7X6E0p7j16qurbz0Zn/DN/tOmCZcUmYUhoSA4w8FiH0bvDXai71ARdlZpoykWA/J@lists.freedesktop.org,
 AJvYcCXA1nuhHtvWhVD8SKXcME86sw2xbGTLLLf7jU5GiyVAxO+Y8eiMFnnOLR84neFOzIllu4ea1vY7EnZQ@lists.freedesktop.org,
 AJvYcCXlYfV0BPan2yh2Pzy27pAsp9yxy/xVTB5Pb7EgNqaxfLloHeW97jRUFij3U5XteUCh+y+qnlhw@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8lhcQLCdRLMWT31iH8aAqxqlSjt4pS0erQYMmThZwxbeagIIz
 a6QCbemGMD9t0PzxBo2GhyAMCBAr20hyKchItWXpWttCUkxJl0VOtngyOd2s8vs9sJV7t/bpbKy
 Ik8Kjnw9hakTHlnWFKgT34OxiLiU=
X-Google-Smtp-Source: AGHT+IFQAp3SzTsJhy40S/srj1DhwyABrbfpssrIv2j5MdyTntuoiQ5YHnzUQbEkOqLr3aX9QK9/B87iRUH2BKpjEv8=
X-Received: by 2002:a05:6a00:3cd1:b0:70e:acd0:d8b6 with SMTP id
 d2e1a72fcca58-7144540709cmr11913098b3a.0.1724853547194; Wed, 28 Aug 2024
 06:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240812122312.1567046-1-jani.nikula@intel.com>
 <20240812122312.1567046-3-jani.nikula@intel.com>
 <Zs8kJOC2pH7gSfET@phenom.ffwll.local> <87plpsydda.fsf@intel.com>
In-Reply-To: <87plpsydda.fsf@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 28 Aug 2024 09:58:55 -0400
Message-ID: <CADnq5_OoY-Wt56=_XHjZGgZk2LrgXB5U34TOcjWqyO-+Ou9W8Q@mail.gmail.com>
Subject: Re: [RESEND 3/3] drm/amd/display: switch to guid_gen() to generate
 valid GUIDs
To: Jani Nikula <jani.nikula@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
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

On Wed, Aug 28, 2024 at 9:53=E2=80=AFAM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> On Wed, 28 Aug 2024, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > On Mon, Aug 12, 2024 at 03:23:12PM +0300, Jani Nikula wrote:
> >> Instead of just smashing jiffies into a GUID, use guid_gen() to genera=
te
> >> RFC 4122 compliant GUIDs.
> >>
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >>
> >> ---
> >>
> >> Side note, it baffles me why amdgpu has a copy of this instead of
> >> plumbing it into drm mst code.
> >
> > Yeah ec5fa9fcdeca ("drm/amd/display: Adjust the MST resume flow") promi=
sed
> > a follow-up, but that seems to have never materialized. Really should
> > materialize though. Patch lgtm
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Thanks!
>
> Cc: AMD folks, ack for merging the series via drm-misc-next?

Unless Harry has any objections,
Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
> BR,
> Jani.
>
>
> >
> >
> >> ---
> >>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 23 ++++++++++--------=
-
> >>  1 file changed, 12 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drive=
rs/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> index 72c10fc2c890..ce05e7e2a383 100644
> >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> @@ -2568,9 +2568,9 @@ static int dm_late_init(void *handle)
> >>
> >>  static void resume_mst_branch_status(struct drm_dp_mst_topology_mgr *=
mgr)
> >>  {
> >> +    u8 buf[UUID_SIZE];
> >> +    guid_t guid;
> >>      int ret;
> >> -    u8 guid[16];
> >> -    u64 tmp64;
> >>
> >>      mutex_lock(&mgr->lock);
> >>      if (!mgr->mst_primary)
> >> @@ -2591,26 +2591,27 @@ static void resume_mst_branch_status(struct dr=
m_dp_mst_topology_mgr *mgr)
> >>      }
> >>
> >>      /* Some hubs forget their guids after they resume */
> >> -    ret =3D drm_dp_dpcd_read(mgr->aux, DP_GUID, guid, 16);
> >> -    if (ret !=3D 16) {
> >> +    ret =3D drm_dp_dpcd_read(mgr->aux, DP_GUID, buf, sizeof(buf));
> >> +    if (ret !=3D sizeof(buf)) {
> >>              drm_dbg_kms(mgr->dev, "dpcd read failed - undocked during=
 suspend?\n");
> >>              goto out_fail;
> >>      }
> >>
> >> -    if (memchr_inv(guid, 0, 16) =3D=3D NULL) {
> >> -            tmp64 =3D get_jiffies_64();
> >> -            memcpy(&guid[0], &tmp64, sizeof(u64));
> >> -            memcpy(&guid[8], &tmp64, sizeof(u64));
> >> +    import_guid(&guid, buf);
> >>
> >> -            ret =3D drm_dp_dpcd_write(mgr->aux, DP_GUID, guid, 16);
> >> +    if (guid_is_null(&guid)) {
> >> +            guid_gen(&guid);
> >> +            export_guid(buf, &guid);
> >>
> >> -            if (ret !=3D 16) {
> >> +            ret =3D drm_dp_dpcd_write(mgr->aux, DP_GUID, buf, sizeof(=
buf));
> >> +
> >> +            if (ret !=3D sizeof(buf)) {
> >>                      drm_dbg_kms(mgr->dev, "check mstb guid failed - u=
ndocked during suspend?\n");
> >>                      goto out_fail;
> >>              }
> >>      }
> >>
> >> -    import_guid(&mgr->mst_primary->guid, guid);
> >> +    guid_copy(&mgr->mst_primary->guid, &guid);
> >>
> >>  out_fail:
> >>      mutex_unlock(&mgr->lock);
> >> --
> >> 2.39.2
> >>
>
> --
> Jani Nikula, Intel
