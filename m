Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFUeDqe/b2kOMQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 18:47:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D1648D02
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 18:47:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC83E10E1A3;
	Tue, 20 Jan 2026 17:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.b="bIfQKQue";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC5E10E1A3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 17:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=References: To: Cc: In-Reply-To: Date: Subject: Mime-Version:
 Content-Type: Message-Id: From; q=dns/txt; s=fe-953a8a3ca9; t=1768931233;
 bh=7MIzic+Es/z7rMcG3xrBCRoO7u0vnggyXiDjz2kil8M=;
 b=bIfQKQueCOyO5rPHE6hJO0U7DT6VDB5n4zyNNEHfoo5BVAduHZw2XIadUCsAQsfBAEJRJOeOR
 PcNJathR5chsdtjgnQGmXc1QpVEacm96rcVTnWOQRMfIj310A7Jbex6vxUCH+TbneMl+VAzVRLv
 +d620opv3Op3Ayd369am2pw5qCRPxnoG6znI1JL11/gpTIxR95W52SsmTqzSFhtPnS2MunimVpt
 yUqxW5D2XVifQ55CC7GSbD0cq74g/gGYXDhBdYmrrLq/7VDKel7UkZMzcBLWldglqXP1KbTwCEH
 RUj+jysC58nZWjvhJvMmi8LOORdWA6twf1Hql5+hHRgQ==
X-Forward-Email-ID: 696fbfa077d9fdc6f4dac9db
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.3.7
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: "jpeisach@ubuntu.com" <jpeisach@ubuntu.com>
Message-Id: <F9D0FB5B-2C81-4BC1-B6D4-8E660ABE2D9B@ubuntu.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_0A198576-722A-4463-9131-510A57D06179"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.400.12\))
Subject: Re: [PATCH] drm/edid: Use struct cea_db when parsing HDMI VSDB
Date: Tue, 20 Jan 2026 12:46:59 -0500
In-Reply-To: <aW-1d--9syo7F61k@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org
To: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20260117205139.13991-1-jpeisach@ubuntu.com>
 <cb276398394bd5de209dfcee5216fcb2f6670974@intel.com>
 <aW-iQPICWLQ6Iez7@intel.com>
 <E4531EA5-EF45-493F-A1EB-7677D0BC71FC@ubuntu.com>
 <aW-1d--9syo7F61k@intel.com>
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
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jani.nikula@linux.intel.com,m:ville.syrjala@linux.intel.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jpeisach@ubuntu.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,ubuntu.com:email,ubuntu.com:dkim,ubuntu.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 91D1648D02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--Apple-Mail=_0A198576-722A-4463-9131-510A57D06179
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Jan 20, 2026, at 12:03=E2=80=AFPM, Ville Syrj=C3=A4l=C3=A4 =
<ville.syrjala@linux.intel.com> wrote:
>=20
> On Tue, Jan 20, 2026 at 11:37:59AM -0500, jpeisach@ubuntu.com =
<mailto:jpeisach@ubuntu.com> wrote:
>>=20
>>=20
>>> On Jan 20, 2026, at 10:41=E2=80=AFAM, Ville Syrj=C3=A4l=C3=A4 =
<ville.syrjala@linux.intel.com> wrote:
>>>=20
>>> On Mon, Jan 19, 2026 at 03:39:12PM +0200, Jani Nikula wrote:
>>>> On Sat, 17 Jan 2026, Joshua Peisach <jpeisach@ubuntu.com> wrote:
>>>>> drm_parse_hdmi_vsdb_video is one of the parsers that still do not =
use the
>>>>> cea_db struct, and currently passes a u8 pointer.
>>>>>=20
>>>>> Set the correct struct type and update references to the data =
accordingly.
>>>>> This also makes the same change to drm_parse_hdmi_deep_color_info =
as
>>>>> necessary.
>>>>>=20
>>>>> Signed-off-by: Joshua Peisach <jpeisach@ubuntu.com>
>>>>> ---
>>>>> drivers/gpu/drm/drm_edid.c | 26 +++++++++++++-------------
>>>>> 1 file changed, 13 insertions(+), 13 deletions(-)
>>>>>=20
>>>>> diff --git a/drivers/gpu/drm/drm_edid.c =
b/drivers/gpu/drm/drm_edid.c
>>>>> index 26bb7710a..15bd99e65 100644
>>>>> --- a/drivers/gpu/drm/drm_edid.c
>>>>> +++ b/drivers/gpu/drm/drm_edid.c
>>>>> @@ -6290,7 +6290,7 @@ static void drm_parse_hdmi_forum_scds(struct =
drm_connector *connector,
>>>>> }
>>>>>=20
>>>>> static void drm_parse_hdmi_deep_color_info(struct drm_connector =
*connector,
>>>>> -					   const u8 *hdmi)
>>>>> +					   const struct cea_db *db)
>>>>> {
>>>>> 	struct drm_display_info *info =3D &connector->display_info;
>>>>> 	unsigned int dc_bpc =3D 0;
>>>>> @@ -6298,24 +6298,24 @@ static void =
drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
>>>>> 	/* HDMI supports at least 8 bpc */
>>>>> 	info->bpc =3D 8;
>>>>>=20
>>>>> -	if (cea_db_payload_len(hdmi) < 6)
>>>>> +	if (cea_db_payload_len(db) < 6)
>>>>> 		return;
>>>>>=20
>>>>> -	if (hdmi[6] & DRM_EDID_HDMI_DC_30) {
>>>>> +	if (db->data[6] & DRM_EDID_HDMI_DC_30) {
>>>>=20
>>>> That's not the same thing, but off-by-one now. Ditto everywhere =
that
>>>> changes from u8* to db->data[].
>>>>=20
>>>> The main problem with the change (even with fixed offsets) is that =
the
>>>> *specs* typically use indexing from the beginning of the data =
block, not
>>>> from the beginning of payload data.
>>>>=20
>>>> We've discussed this before with Ville (Cc'd) but I'm not sure if =
we
>>>> reached a conclusion.
>>>=20
>>> I guess we could give up on the index matching the spec byte#.
>>> Looks like the HDMI VSDB parsing is the only place where we
>>> actually have the two match, and everwhere else it's
>>> already inconsistent.
>>>=20
>>> Also maybe we should add something to also exclude the
>>> extended tag from the payload, for the blocks that use
>>> the extended tag...
>>>=20
>>> --=20
>>> Ville Syrj=C3=A4l=C3=A4
>>> Intel
>>=20
>> I personally believe it is important to match the spec for =
consistency
>> and reference. Unless I am looking at the wrong thing, bit 6 should =
have
>> the correct index.
>>=20
>> Also I think cea_db in the context of the function calls here are
>> just the data blocks. Unless you mean that by having the struct's =
first
>> member being the tag_length if offsetting everything, but I don't =
think
>> it is? Let me know if I'm wrong :)
>=20
> The tag+length byte is:
> byte# 1 in the CTA spec
> byte# 0 in the HDMI spec
>=20
> There's no super nice way to use the byte# as the index for both.
> Also the length checks end up looking somewhat confusing when
> comparing them with the corresponding index.
>=20
> --=20
> Ville Syrj=C3=A4l=C3=A4
> Intel

The name of the functions specifically say HDMI, so I think that's the
system to use: there are functions that say CTA in the name, like
parse_cta_y420cmdb - so that is CTA, and these functions follow HDMI.

Maybe in a v2 patch, drop a comment clarifying this? At the top of the=20=

drm_parse_hdmi_vsdb_video function it does say HDMI.

-Josh=

--Apple-Mail=_0A198576-722A-4463-9131-510A57D06179
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html aria-label=3D"message body"><head><meta http-equiv=3D"content-type" =
content=3D"text/html; charset=3Dutf-8"></head><body =
style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;"><br =
id=3D"lineBreakAtBeginningOfMessage"><div><br><blockquote =
type=3D"cite"><div>On Jan 20, 2026, at 12:03=E2=80=AFPM, Ville Syrj=C3=A4l=
=C3=A4 &lt;ville.syrjala@linux.intel.com&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div><meta charset=3D"UTF-8"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">On Tue, Jan 20, 2026 at 11:37:59AM =
-0500,<span class=3D"Apple-converted-space">&nbsp;</span></span><a =
href=3D"mailto:jpeisach@ubuntu.com" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: =
0px;">jpeisach@ubuntu.com</a><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;"><span =
class=3D"Apple-converted-space">&nbsp;</span>wrote:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: =
solid;"><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: =
none; text-decoration-thickness: auto; text-decoration-style: =
solid;"><br><br><blockquote type=3D"cite">On Jan 20, 2026, at =
10:41=E2=80=AFAM, Ville Syrj=C3=A4l=C3=A4 =
&lt;ville.syrjala@linux.intel.com&gt; wrote:<br><br>On Mon, Jan 19, 2026 =
at 03:39:12PM +0200, Jani Nikula wrote:<br><blockquote type=3D"cite">On =
Sat, 17 Jan 2026, Joshua Peisach &lt;jpeisach@ubuntu.com&gt; =
wrote:<br><blockquote type=3D"cite">drm_parse_hdmi_vsdb_video is one of =
the parsers that still do not use the<br>cea_db struct, and currently =
passes a u8 pointer.<br><br>Set the correct struct type and update =
references to the data accordingly.<br>This also makes the same change =
to drm_parse_hdmi_deep_color_info as<br>necessary.<br><br>Signed-off-by: =
Joshua Peisach =
&lt;jpeisach@ubuntu.com&gt;<br>---<br>drivers/gpu/drm/drm_edid.c | 26 =
+++++++++++++-------------<br>1 file changed, 13 insertions(+), 13 =
deletions(-)<br><br>diff --git a/drivers/gpu/drm/drm_edid.c =
b/drivers/gpu/drm/drm_edid.c<br>index 26bb7710a..15bd99e65 100644<br>--- =
a/drivers/gpu/drm/drm_edid.c<br>+++ b/drivers/gpu/drm/drm_edid.c<br>@@ =
-6290,7 +6290,7 @@ static void drm_parse_hdmi_forum_scds(struct =
drm_connector *connector,<br>}<br><br>static void =
drm_parse_hdmi_deep_color_info(struct drm_connector =
*connector,<br>-<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;const u8 =
*hdmi)<br>+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;const struct =
cea_db *db)<br>{<br><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>struct drm_display_info *info =3D =
&amp;connector-&gt;display_info;<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>unsigned int dc_bpc =3D 0;<br>@@ =
-6298,24 +6298,24 @@ static void drm_parse_hdmi_deep_color_info(struct =
drm_connector *connector,<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>/* HDMI supports at least 8 bpc =
*/<br><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>info-&gt;bpc =3D 8;<br><br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (cea_db_payload_len(hdmi) &lt; =
6)<br>+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (cea_db_payload_len(db) &lt; 6)<br><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>return;<br><br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (hdmi[6] &amp; =
DRM_EDID_HDMI_DC_30) {<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (db-&gt;data[6] &amp; =
DRM_EDID_HDMI_DC_30) {<br></blockquote><br>That's not the same thing, =
but off-by-one now. Ditto everywhere that<br>changes from u8* to =
db-&gt;data[].<br><br>The main problem with the change (even with fixed =
offsets) is that the<br>*specs* typically use indexing from the =
beginning of the data block, not<br>from the beginning of payload =
data.<br><br>We've discussed this before with Ville (Cc'd) but I'm not =
sure if we<br>reached a conclusion.<br></blockquote><br>I guess we could =
give up on the index matching the spec byte#.<br>Looks like the HDMI =
VSDB parsing is the only place where we<br>actually have the two match, =
and everwhere else it's<br>already inconsistent.<br><br>Also maybe we =
should add something to also exclude the<br>extended tag from the =
payload, for the blocks that use<br>the extended tag...<br><br>--<span =
class=3D"Apple-converted-space">&nbsp;</span><br>Ville =
Syrj=C3=A4l=C3=A4<br>Intel<br></blockquote><br>I personally believe it =
is important to match the spec for consistency<br>and reference. Unless =
I am looking at the wrong thing, bit 6 should have<br>the correct =
index.<br><br>Also I think cea_db in the context of the function calls =
here are<br>just the data blocks. Unless you mean that by having the =
struct's first<br>member being the tag_length if offsetting everything, =
but I don't think<br>it is? Let me know if I'm wrong =
:)<br></blockquote><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration-line: none; text-decoration-thickness: auto; =
text-decoration-style: solid;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">The tag+length byte is:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">byte# 1 in the CTA spec</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">byte# 0 in the HDMI spec</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">There's no super nice way to use the byte# =
as the index for both.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">Also the length checks end up looking =
somewhat confusing when</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">comparing them with the corresponding =
index.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration-line: none; text-decoration-thickness: auto; =
text-decoration-style: solid;"><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">--<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">Ville Syrj=C3=A4l=C3=A4</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline =
!important;">Intel</span></div></blockquote></div><br><div>The name of =
the functions specifically say HDMI, so I think that's =
the</div><div>system to use: there are functions that say CTA in the =
name, like</div><div>parse_cta_y420cmdb - so that is CTA, and these =
functions follow HDMI.</div><div><br></div><div>Maybe in a v2 patch, =
drop a comment clarifying this? At the top of =
the&nbsp;</div><div>drm_parse_hdmi_vsdb_video function it does say =
HDMI.</div><div><br></div><div>-Josh</div></body></html>=

--Apple-Mail=_0A198576-722A-4463-9131-510A57D06179--
