Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KsxLSmzb2nHMAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:54:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 227EB48048
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 17:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7099710E638;
	Tue, 20 Jan 2026 16:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.b="juEARod1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 942 seconds by postgrey-1.36 at gabe;
 Tue, 20 Jan 2026 16:53:56 UTC
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D462610E639
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 16:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com; h=To:
 References: Message-Id: Content-Transfer-Encoding: Cc: Date: In-Reply-To:
 From: Subject: Mime-Version: Content-Type; q=dns/txt; s=fe-953a8a3ca9;
 t=1768928036; bh=3CE46SKL/0tYDqnGDyFi3twlzlU1U1an16z5b4yjAeQ=;
 b=juEARod1lHyFKHfN5uWF4Glor+9aXG+24pfU0pulnbjITOeay7ONtYIt6Yycn4iZO/KflzhKy
 YrwMv9TIj7bUUtuB5DOoAjOyzpiyQB4QtMBQTfYSalrblmc1sDuTdjufg0t1dnUX5H3CKaxcyi/
 +2JBsTNKG/B3QLinieqO0dPXF5bhWYu8S8AsiE2rd5Ek92/g38+/DhM/U8+nRJU6fsThmhBlHYa
 QiZ8uRt2+k/EXYVsJcotPpj9GLevba1FVkYs0gUJeS0wVmbibiM8bWP3APNh9EkiA3vhpmd4hpK
 AxiF6G9e/5zSleBhR02HIC51oWkJPtbDXGXR4Yq+BhJg==
X-Forward-Email-ID: 696faf740f51d7f37bab7c9b
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.3.7
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.400.12\))
Subject: Re: [PATCH] drm/edid: Use struct cea_db when parsing HDMI VSDB
From: "jpeisach@ubuntu.com" <jpeisach@ubuntu.com>
In-Reply-To: <aW-iQPICWLQ6Iez7@intel.com>
Date: Tue, 20 Jan 2026 11:37:59 -0500
Cc: Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E4531EA5-EF45-493F-A1EB-7677D0BC71FC@ubuntu.com>
References: <20260117205139.13991-1-jpeisach@ubuntu.com>
 <cb276398394bd5de209dfcee5216fcb2f6670974@intel.com>
 <aW-iQPICWLQ6Iez7@intel.com>
To: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
X-Mailer: Apple Mail (2.3864.400.12)
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	FROM_DN_EQ_ADDR(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ubuntu.com,none];
	R_DKIM_ALLOW(-0.20)[ubuntu.com:s=fe-953a8a3ca9];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jani.nikula@linux.intel.com,m:ville.syrjala@linux.intel.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jpeisach@ubuntu.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jpeisach@ubuntu.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[ubuntu.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	APPLE_MAILER_COMMON(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,ubuntu.com:email,ubuntu.com:dkim,ubuntu.com:mid]
X-Rspamd-Queue-Id: 227EB48048
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



> On Jan 20, 2026, at 10:41=E2=80=AFAM, Ville Syrj=C3=A4l=C3=A4 =
<ville.syrjala@linux.intel.com> wrote:
>=20
> On Mon, Jan 19, 2026 at 03:39:12PM +0200, Jani Nikula wrote:
>> On Sat, 17 Jan 2026, Joshua Peisach <jpeisach@ubuntu.com> wrote:
>>> drm_parse_hdmi_vsdb_video is one of the parsers that still do not =
use the
>>> cea_db struct, and currently passes a u8 pointer.
>>>=20
>>> Set the correct struct type and update references to the data =
accordingly.
>>> This also makes the same change to drm_parse_hdmi_deep_color_info as
>>> necessary.
>>>=20
>>> Signed-off-by: Joshua Peisach <jpeisach@ubuntu.com>
>>> ---
>>> drivers/gpu/drm/drm_edid.c | 26 +++++++++++++-------------
>>> 1 file changed, 13 insertions(+), 13 deletions(-)
>>>=20
>>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>>> index 26bb7710a..15bd99e65 100644
>>> --- a/drivers/gpu/drm/drm_edid.c
>>> +++ b/drivers/gpu/drm/drm_edid.c
>>> @@ -6290,7 +6290,7 @@ static void drm_parse_hdmi_forum_scds(struct =
drm_connector *connector,
>>> }
>>>=20
>>> static void drm_parse_hdmi_deep_color_info(struct drm_connector =
*connector,
>>> -					   const u8 *hdmi)
>>> +					   const struct cea_db *db)
>>> {
>>> 	struct drm_display_info *info =3D &connector->display_info;
>>> 	unsigned int dc_bpc =3D 0;
>>> @@ -6298,24 +6298,24 @@ static void =
drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
>>> 	/* HDMI supports at least 8 bpc */
>>> 	info->bpc =3D 8;
>>>=20
>>> -	if (cea_db_payload_len(hdmi) < 6)
>>> +	if (cea_db_payload_len(db) < 6)
>>> 		return;
>>>=20
>>> -	if (hdmi[6] & DRM_EDID_HDMI_DC_30) {
>>> +	if (db->data[6] & DRM_EDID_HDMI_DC_30) {
>>=20
>> That's not the same thing, but off-by-one now. Ditto everywhere that
>> changes from u8* to db->data[].
>>=20
>> The main problem with the change (even with fixed offsets) is that =
the
>> *specs* typically use indexing from the beginning of the data block, =
not
>> from the beginning of payload data.
>>=20
>> We've discussed this before with Ville (Cc'd) but I'm not sure if we
>> reached a conclusion.
>=20
> I guess we could give up on the index matching the spec byte#.
> Looks like the HDMI VSDB parsing is the only place where we
> actually have the two match, and everwhere else it's
> already inconsistent.
>=20
> Also maybe we should add something to also exclude the
> extended tag from the payload, for the blocks that use
> the extended tag...
>=20
> --=20
> Ville Syrj=C3=A4l=C3=A4
> Intel

I personally believe it is important to match the spec for consistency
and reference. Unless I am looking at the wrong thing, bit 6 should have
the correct index.

Also I think cea_db in the context of the function calls here are
just the data blocks. Unless you mean that by having the struct's first
member being the tag_length if offsetting everything, but I don't think
it is? Let me know if I'm wrong :)

-Josh

