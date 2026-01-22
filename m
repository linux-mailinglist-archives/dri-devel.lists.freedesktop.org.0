Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIm4IYKCcWk1IAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 02:50:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0CE60891
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 02:50:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3674B10E26F;
	Thu, 22 Jan 2026 01:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.b="iicTqBRV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 872 seconds by postgrey-1.36 at gabe;
 Thu, 22 Jan 2026 01:50:55 UTC
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E49710E26F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 01:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1769046654;
 bh=9x9ZEUpWoq8eLlnYr7WSVEerHQ9KPtHlBa0PoVU43QM=;
 b=iicTqBRVoedz1lIEJWEVi73nhdAlYE+SDkpY7UjKspvV/+QUCZHcvoXYOlB+vJM4QrvTVIxLD
 yv+eOVXZeRszwpFqaZJFY5wfdGATh8ukavjMK/503rj6lzTmI2dTyo0aVQevvojrLiZeeAO7nk9
 sUAy4Tdu512AwApHdc4pj4RD7jZEaOIASTEbGWUoC7tq1H7aBtKMQUr2mbv0euWPXTqKaAwo0A9
 tqsjVa3R5Z6LZh6YKUg2Xz56i3ShSlcOhQsx0hevD8DaMZ3zoIBx/qmr0wAtJ9N62xOu8w5Uzxo
 XcxaUiOhhuhqfsWpft1LKZQFEAGFFvrELA10WNr/5B7g==
X-Forward-Email-ID: 69717c8ee635bcbf419e1786
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.4.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Wed, 21 Jan 2026 20:25:33 -0500
Message-Id: <DFUQ5V2HICKQ.1F67J2O6ICMD1@ubuntu.com>
Cc: "Jani Nikula" <jani.nikula@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/edid: Use struct cea_db when parsing HDMI VSDB
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: aerc 0.20.0
References: <20260117205139.13991-1-jpeisach@ubuntu.com>
 <cb276398394bd5de209dfcee5216fcb2f6670974@intel.com>
 <aW-iQPICWLQ6Iez7@intel.com>
 <E4531EA5-EF45-493F-A1EB-7677D0BC71FC@ubuntu.com>
 <aW-1d--9syo7F61k@intel.com>
 <F9D0FB5B-2C81-4BC1-B6D4-8E660ABE2D9B@ubuntu.com>
 <aW_E7bHNsUzDaeC1@intel.com>
 <253467F5-8BB3-4A96-A2D8-90785999A023@ubuntu.com>
 <aW_n569MjpPQmCt2@intel.com>
In-Reply-To: <aW_n569MjpPQmCt2@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[ubuntu.com,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[ubuntu.com:s=fe-953a8a3ca9];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jani.nikula@linux.intel.com,m:ville.syrjala@linux.intel.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jpeisach@ubuntu.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[jpeisach@ubuntu.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[ubuntu.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ubuntu.com:email,ubuntu.com:dkim,ubuntu.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: EC0CE60891
X-Rspamd-Action: no action

On Tue Jan 20, 2026 at 3:39 PM EST, Ville Syrj=C3=A4l=C3=A4 wrote:
> On Tue, Jan 20, 2026 at 03:01:14PM -0500, jpeisach@ubuntu.com wrote:
>>=20
>>=20
>> > On Jan 20, 2026, at 1:09=E2=80=AFPM, Ville Syrj=C3=A4l=C3=A4 <ville.sy=
rjala@linux.intel.com> wrote:
>> >=20
>> > On Tue, Jan 20, 2026 at 12:46:59PM -0500, jpeisach@ubuntu.com <mailto:=
jpeisach@ubuntu.com> wrote:
>> >>=20
>> >>=20
>> >>> On Jan 20, 2026, at 12:03=E2=80=AFPM, Ville Syrj=C3=A4l=C3=A4 <ville=
.syrjala@linux.intel.com <mailto:ville.syrjala@linux.intel.com>> wrote:
>> >>>=20
>> >>> On Tue, Jan 20, 2026 at 11:37:59AM -0500, jpeisach@ubuntu.com <mailt=
o:jpeisach@ubuntu.com> <mailto:jpeisach@ubuntu.com> wrote:
>> >>>>=20
>> >>>>=20
>> >>>>> On Jan 20, 2026, at 10:41=E2=80=AFAM, Ville Syrj=C3=A4l=C3=A4 <vil=
le.syrjala@linux.intel.com> wrote:
>> >>>>>=20
>> >>>>> On Mon, Jan 19, 2026 at 03:39:12PM +0200, Jani Nikula wrote:
>> >>>>>> On Sat, 17 Jan 2026, Joshua Peisach <jpeisach@ubuntu.com> wrote:
>> >>>>>>> drm_parse_hdmi_vsdb_video is one of the parsers that still do no=
t use the
>> >>>>>>> cea_db struct, and currently passes a u8 pointer.
>> >>>>>>>=20
>> >>>>>>> Set the correct struct type and update references to the data ac=
cordingly.
>> >>>>>>> This also makes the same change to drm_parse_hdmi_deep_color_inf=
o as
>> >>>>>>> necessary.
>> >>>>>>>=20
>> >>>>>>> Signed-off-by: Joshua Peisach <jpeisach@ubuntu.com>
>> >>>>>>> ---
>> >>>>>>> drivers/gpu/drm/drm_edid.c | 26 +++++++++++++-------------
>> >>>>>>> 1 file changed, 13 insertions(+), 13 deletions(-)
>> >>>>>>>=20
>> >>>>>>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_ed=
id.c
>> >>>>>>> index 26bb7710a..15bd99e65 100644
>> >>>>>>> --- a/drivers/gpu/drm/drm_edid.c
>> >>>>>>> +++ b/drivers/gpu/drm/drm_edid.c
>> >>>>>>> @@ -6290,7 +6290,7 @@ static void drm_parse_hdmi_forum_scds(stru=
ct drm_connector *connector,
>> >>>>>>> }
>> >>>>>>>=20
>> >>>>>>> static void drm_parse_hdmi_deep_color_info(struct drm_connector =
*connector,
>> >>>>>>> -					   const u8 *hdmi)
>> >>>>>>> +					   const struct cea_db *db)
>> >>>>>>> {
>> >>>>>>> 	struct drm_display_info *info =3D &connector->display_info;
>> >>>>>>> 	unsigned int dc_bpc =3D 0;
>> >>>>>>> @@ -6298,24 +6298,24 @@ static void drm_parse_hdmi_deep_color_in=
fo(struct drm_connector *connector,
>> >>>>>>> 	/* HDMI supports at least 8 bpc */
>> >>>>>>> 	info->bpc =3D 8;
>> >>>>>>>=20
>> >>>>>>> -	if (cea_db_payload_len(hdmi) < 6)
>> >>>>>>> +	if (cea_db_payload_len(db) < 6)
>> >>>>>>> 		return;
>> >>>>>>>=20
>> >>>>>>> -	if (hdmi[6] & DRM_EDID_HDMI_DC_30) {
>> >>>>>>> +	if (db->data[6] & DRM_EDID_HDMI_DC_30) {
>> >>>>>>=20
>> >>>>>> That's not the same thing, but off-by-one now. Ditto everywhere t=
hat
>> >>>>>> changes from u8* to db->data[].
>> >>>>>>=20
>> >>>>>> The main problem with the change (even with fixed offsets) is tha=
t the
>> >>>>>> *specs* typically use indexing from the beginning of the data blo=
ck, not
>> >>>>>> from the beginning of payload data.
>> >>>>>>=20
>> >>>>>> We've discussed this before with Ville (Cc'd) but I'm not sure if=
 we
>> >>>>>> reached a conclusion.
>> >>>>>=20
>> >>>>> I guess we could give up on the index matching the spec byte#.
>> >>>>> Looks like the HDMI VSDB parsing is the only place where we
>> >>>>> actually have the two match, and everwhere else it's
>> >>>>> already inconsistent.
>> >>>>>=20
>> >>>>> Also maybe we should add something to also exclude the
>> >>>>> extended tag from the payload, for the blocks that use
>> >>>>> the extended tag...
>> >>>>>=20
>> >>>>> --=20
>> >>>>> Ville Syrj=C3=A4l=C3=A4
>> >>>>> Intel
>> >>>>=20
>> >>>> I personally believe it is important to match the spec for consiste=
ncy
>> >>>> and reference. Unless I am looking at the wrong thing, bit 6 should=
 have
>> >>>> the correct index.
>> >>>>=20
>> >>>> Also I think cea_db in the context of the function calls here are
>> >>>> just the data blocks. Unless you mean that by having the struct's f=
irst
>> >>>> member being the tag_length if offsetting everything, but I don't t=
hink
>> >>>> it is? Let me know if I'm wrong :)
>> >>>=20
>> >>> The tag+length byte is:
>> >>> byte# 1 in the CTA spec
>> >>> byte# 0 in the HDMI spec
>> >>>=20
>> >>> There's no super nice way to use the byte# as the index for both.
>> >>> Also the length checks end up looking somewhat confusing when
>> >>> comparing them with the corresponding index.
>> >>>=20
>> >>> --=20
>> >>> Ville Syrj=C3=A4l=C3=A4
>> >>> Intel
>> >>=20
>> >> The name of the functions specifically say HDMI, so I think that's th=
e
>> >> system to use: there are functions that say CTA in the name, like
>> >> parse_cta_y420cmdb - so that is CTA, and these functions follow HDMI.
>> >=20
>> > I'm saying that there is no really sane way to deal with the CTA byte#
>> > convention. So I think it's probably best to just go for a single
>> > consistent approach for both CTA and HDMI. That way people at least
>> > won't get confused by the different convetion between the functions.
>> > And the length checks wouldn't look incorrect.
>> >=20
>>=20
>> I agree. I can't think of anything though, other than to assume CTA.
>>=20
>> The other parsers that already use struct cea_db refer to the data
>> using the CTA spec (starting at 1). Maybe just go with that?
>
> Nothing is indexed using the CTA byte#. To do that we'd have to
> do something like 'u8 *db =3D start_of_db - 1'.
>
> I can more or less see these variants:
> 1. relative to the start of the data block
>    (eg. drm_parse_hdr_metadata_block(), drm_parse_vcdb())
> 2. relative to the start of the payload
>    (eg. parse_cta_vdb())
> 3. relative to the first byte past the extended tag
>    (y420* stuff)
>
> And I'm suggesting that perhaps everything should use either
> 2 or 3 depending on whether the extended tag is present.

Makes sense to me.

However, as for "drm_parse_hdmi_vsdb_video", that is not specific to
CTA. So I guess keep the function names and just correct the indexes?

--
Josh
