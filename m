Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF61AD3BC49
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 01:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37EE10E0BA;
	Tue, 20 Jan 2026 00:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.b="RTC9I5xb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1312 seconds by postgrey-1.36 at gabe;
 Mon, 19 Jan 2026 23:06:49 UTC
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB9310E0B1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 23:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=References: To: Cc: In-Reply-To: Date: Subject: Mime-Version:
 Content-Type: Message-Id: From; q=dns/txt; s=fe-953a8a3ca9; t=1768864009;
 bh=GOAvIkS47JMRryc+5uLQ2an69IO4ucmVZCQ3lmjAAFU=;
 b=RTC9I5xbbz1uRLclmTGj5srArml+2KQbHmaz65VojjleYKvp/iv0mIkdNfz2EXM1itsI3TqU8
 FrjSDPNitid2ghKTBeBTnNxBokpLW/HvSMis/qtjR0SNVG7VIbJBIuLl/EkajUXC48Jt0s0uJkY
 pF7wOAeedtwPDRL04x8DKzOJaMslnDUntShBlSv9YcZzml13ObemwNbo9+Lyy8LsI/LFJQ5psT6
 sy9ohTQJ3Ose3JfLasWp9+4S+ZSsD8oj0eJgdu8beEISixZQYBptboTgx+q0LwH8A6W/RUTiESR
 L3fg+HiutZUf0rnt+5KNMiHid+W/mKEJgkW227qEmmaw==
X-Forward-Email-ID: 696eb3e65e9fa1468af18b8b
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.3.7
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: "jpeisach@ubuntu.com" <jpeisach@ubuntu.com>
Message-Id: <C730F113-8AD9-4353-9C0B-64EDD52CE940@ubuntu.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_0077CD56-AB61-40C6-ACE1-3EA75817006A"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.400.12\))
Subject: Re: [PATCH] drm/edid: Use struct cea_db when parsing HDMI VSDB
Date: Mon, 19 Jan 2026 17:44:43 -0500
In-Reply-To: <cb276398394bd5de209dfcee5216fcb2f6670974@intel.com>
Cc: dri-devel@lists.freedesktop.org,
 ville.syrjala@linux.intel.com
To: Jani Nikula <jani.nikula@linux.intel.com>
References: <20260117205139.13991-1-jpeisach@ubuntu.com>
 <cb276398394bd5de209dfcee5216fcb2f6670974@intel.com>
X-Mailer: Apple Mail (2.3864.400.12)
X-Mailman-Approved-At: Tue, 20 Jan 2026 00:05:04 +0000
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


--Apple-Mail=_0077CD56-AB61-40C6-ACE1-3EA75817006A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On Jan 19, 2026, at 8:39=E2=80=AFAM, Jani Nikula =
<jani.nikula@linux.intel.com> wrote:
>=20
> On Sat, 17 Jan 2026, Joshua Peisach <jpeisach@ubuntu.com =
<mailto:jpeisach@ubuntu.com>> wrote:
>> drm_parse_hdmi_vsdb_video is one of the parsers that still do not use =
the
>> cea_db struct, and currently passes a u8 pointer.
>>=20
>> Set the correct struct type and update references to the data =
accordingly.
>> This also makes the same change to drm_parse_hdmi_deep_color_info as
>> necessary.
>>=20
>> Signed-off-by: Joshua Peisach <jpeisach@ubuntu.com>
>> ---
>> drivers/gpu/drm/drm_edid.c | 26 +++++++++++++-------------
>> 1 file changed, 13 insertions(+), 13 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 26bb7710a..15bd99e65 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -6290,7 +6290,7 @@ static void drm_parse_hdmi_forum_scds(struct =
drm_connector *connector,
>> }
>>=20
>> static void drm_parse_hdmi_deep_color_info(struct drm_connector =
*connector,
>> -					   const u8 *hdmi)
>> +					   const struct cea_db *db)
>> {
>> 	struct drm_display_info *info =3D &connector->display_info;
>> 	unsigned int dc_bpc =3D 0;
>> @@ -6298,24 +6298,24 @@ static void =
drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
>> 	/* HDMI supports at least 8 bpc */
>> 	info->bpc =3D 8;
>>=20
>> -	if (cea_db_payload_len(hdmi) < 6)
>> +	if (cea_db_payload_len(db) < 6)
>> 		return;
>>=20
>> -	if (hdmi[6] & DRM_EDID_HDMI_DC_30) {
>> +	if (db->data[6] & DRM_EDID_HDMI_DC_30) {
>=20
> That's not the same thing, but off-by-one now. Ditto everywhere that
> changes from u8* to db->data[].
>=20
> The main problem with the change (even with fixed offsets) is that the
> *specs* typically use indexing from the beginning of the data block, =
not
> from the beginning of payload data.
>=20
> We've discussed this before with Ville (Cc'd) but I'm not sure if we
> reached a conclusion.
>=20

Okay, I'll thought the pointer was to the literal same information.

Keep me posted about the indexing of the specs, I will probably submit a =
v2.

Thanks,
-Josh

> BR,
> Jani.
>=20
>=20
>> 		dc_bpc =3D 10;
>> 		info->edid_hdmi_rgb444_dc_modes |=3D =
DRM_EDID_HDMI_DC_30;
>> 		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink =
does deep color 30.\n",
>> 			    connector->base.id, connector->name);
>> 	}
>>=20
>> -	if (hdmi[6] & DRM_EDID_HDMI_DC_36) {
>> +	if (db->data[6] & DRM_EDID_HDMI_DC_36) {
>> 		dc_bpc =3D 12;
>> 		info->edid_hdmi_rgb444_dc_modes |=3D =
DRM_EDID_HDMI_DC_36;
>> 		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink =
does deep color 36.\n",
>> 			    connector->base.id, connector->name);
>> 	}
>>=20
>> -	if (hdmi[6] & DRM_EDID_HDMI_DC_48) {
>> +	if (db->data[6] & DRM_EDID_HDMI_DC_48) {
>> 		dc_bpc =3D 16;
>> 		info->edid_hdmi_rgb444_dc_modes |=3D =
DRM_EDID_HDMI_DC_48;
>> 		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink =
does deep color 48.\n",
>> @@ -6333,7 +6333,7 @@ static void =
drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
>> 	info->bpc =3D dc_bpc;
>>=20
>> 	/* YCRCB444 is optional according to spec. */
>> -	if (hdmi[6] & DRM_EDID_HDMI_DC_Y444) {
>> +	if (db->data[6] & DRM_EDID_HDMI_DC_Y444) {
>> 		info->edid_hdmi_ycbcr444_dc_modes =3D =
info->edid_hdmi_rgb444_dc_modes;
>> 		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink =
does YCRCB444 in deep color.\n",
>> 			    connector->base.id, connector->name);
>> @@ -6343,7 +6343,7 @@ static void =
drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
>> 	 * Spec says that if any deep color mode is supported at all,
>> 	 * then deep color 36 bit must be supported.
>> 	 */
>> -	if (!(hdmi[6] & DRM_EDID_HDMI_DC_36)) {
>> +	if (!(db->data[6] & DRM_EDID_HDMI_DC_36)) {
>> 		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI sink =
should do DC_36, but does not!\n",
>> 			    connector->base.id, connector->name);
>> 	}
>> @@ -6351,19 +6351,19 @@ static void =
drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
>>=20
>> /* HDMI Vendor-Specific Data Block (HDMI VSDB, H14b-VSDB) */
>> static void
>> -drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 =
*db)
>> +drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const =
struct cea_db *db)
>> {
>> 	struct drm_display_info *info =3D &connector->display_info;
>> 	u8 len =3D cea_db_payload_len(db);
>>=20
>> 	info->is_hdmi =3D true;
>>=20
>> -	info->source_physical_address =3D (db[4] << 8) | db[5];
>> +	info->source_physical_address =3D (db->data[4] << 8) | =
db->data[5];
>>=20
>> 	if (len >=3D 6)
>> -		info->dvi_dual =3D db[6] & 1;
>> +		info->dvi_dual =3D db->data[6] & 1;
>> 	if (len >=3D 7)
>> -		info->max_tmds_clock =3D db[7] * 5000;
>> +		info->max_tmds_clock =3D db->data[7] * 5000;
>>=20
>> 	/*
>> 	 * Try to infer whether the sink supports HDMI infoframes.
>> @@ -6371,7 +6371,7 @@ drm_parse_hdmi_vsdb_video(struct drm_connector =
*connector, const u8 *db)
>> 	 * HDMI infoframe support was first added in HDMI 1.4. Assume =
the sink
>> 	 * supports infoframes if HDMI_Video_present is set.
>> 	 */
>> -	if (len >=3D 8 && db[8] & BIT(5))
>> +	if (len >=3D 8 && db->data[8] & BIT(5))
>> 		info->has_hdmi_infoframe =3D true;
>>=20
>> 	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI: DVI dual =
%d, max TMDS clock %d kHz\n",
>> @@ -6443,7 +6443,7 @@ static void drm_parse_cea_ext(struct =
drm_connector *connector,
>> 		const u8 *data =3D (const u8 *)db;
>>=20
>> 		if (cea_db_is_hdmi_vsdb(db))
>> -			drm_parse_hdmi_vsdb_video(connector, data);
>> +			drm_parse_hdmi_vsdb_video(connector, db);
>> 		else if (cea_db_is_hdmi_forum_vsdb(db) ||
>> 			 cea_db_is_hdmi_forum_scdb(db))
>> 			drm_parse_hdmi_forum_scds(connector, data);
>=20
> --=20
> Jani Nikula, Intel


--Apple-Mail=_0077CD56-AB61-40C6-ACE1-3EA75817006A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html aria-label=3D"message body"><head><meta http-equiv=3D"content-type" =
content=3D"text/html; charset=3Dutf-8"></head><body =
style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;"><br =
id=3D"lineBreakAtBeginningOfMessage"><div><br><blockquote =
type=3D"cite"><div>On Jan 19, 2026, at 8:39=E2=80=AFAM, Jani Nikula =
&lt;jani.nikula@linux.intel.com&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div><meta charset=3D"UTF-8"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">On Sat, 17 Jan 2026, Joshua Peisach =
&lt;</span><a href=3D"mailto:jpeisach@ubuntu.com" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: =
0px;">jpeisach@ubuntu.com</a><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">&gt; wrote:</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: =
solid;"><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: =
none; text-decoration-thickness: auto; text-decoration-style: =
solid;">drm_parse_hdmi_vsdb_video is one of the parsers that still do =
not use the<br>cea_db struct, and currently passes a u8 =
pointer.<br><br>Set the correct struct type and update references to the =
data accordingly.<br>This also makes the same change to =
drm_parse_hdmi_deep_color_info as<br>necessary.<br><br>Signed-off-by: =
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
DRM_EDID_HDMI_DC_30) {<br></blockquote><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
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
display: inline !important;">That's not the same thing, but off-by-one =
now. Ditto everywhere that</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
display: inline !important;">changes from u8* to =
db-&gt;data[].</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: =
solid;"><br></div></blockquote><blockquote type=3D"cite"><div><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">The main problem with the change (even with =
fixed offsets) is that the</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
display: inline !important;">*specs* typically use indexing from the =
beginning of the data block, not</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
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
display: inline !important;">from the beginning of payload =
data.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
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
display: inline !important;">We've discussed this before with Ville =
(Cc'd) but I'm not sure if we</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
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
display: inline !important;">reached a conclusion.</span><br =
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
text-decoration-thickness: auto; text-decoration-style: =
solid;"></div></blockquote><div><br></div><div>Okay, I'll thought the =
pointer was to the literal same =
information.</div><div><br></div><div>Keep me posted about the indexing =
of the specs, I will probably submit a =
v2.</div><div><br></div><div>Thanks,</div><div>-Josh</div><br><blockquote =
type=3D"cite"><div><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">BR,</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
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
display: inline !important;">Jani.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><br =
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
text-decoration-thickness: auto; text-decoration-style: =
solid;"><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: =
none; text-decoration-thickness: auto; text-decoration-style: =
solid;"><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>dc_bpc =3D 10;<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	=
</span>info-&gt;edid_hdmi_rgb444_dc_modes |=3D =
DRM_EDID_HDMI_DC_30;<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>drm_dbg_kms(connector-&gt;dev, =
"[CONNECTOR:%d:%s] HDMI sink does deep color 30.\n",<br><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;connector-&=
gt;base.id, connector-&gt;name);<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>}<br><br>-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(hdmi[6] &amp; DRM_EDID_HDMI_DC_36) {<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (db-&gt;data[6] &amp; =
DRM_EDID_HDMI_DC_36) {<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>dc_bpc =3D 12;<br><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>info-&gt;edid_hdmi_rgb444_dc_modes |=3D =
DRM_EDID_HDMI_DC_36;<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>drm_dbg_kms(connector-&gt;dev, =
"[CONNECTOR:%d:%s] HDMI sink does deep color 36.\n",<br><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;connector-&=
gt;base.id, connector-&gt;name);<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>}<br><br>-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(hdmi[6] &amp; DRM_EDID_HDMI_DC_48) {<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (db-&gt;data[6] &amp; =
DRM_EDID_HDMI_DC_48) {<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>dc_bpc =3D 16;<br><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>info-&gt;edid_hdmi_rgb444_dc_modes |=3D =
DRM_EDID_HDMI_DC_48;<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>drm_dbg_kms(connector-&gt;dev, =
"[CONNECTOR:%d:%s] HDMI sink does deep color 48.\n",<br>@@ -6333,7 =
+6333,7 @@ static void drm_parse_hdmi_deep_color_info(struct =
drm_connector *connector,<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>info-&gt;bpc =3D =
dc_bpc;<br><br><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>/* YCRCB444 is optional according to spec. */<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(hdmi[6] &amp; DRM_EDID_HDMI_DC_Y444) {<br>+<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span>if (db-&gt;data[6] &amp; =
DRM_EDID_HDMI_DC_Y444) {<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	=
</span>info-&gt;edid_hdmi_ycbcr444_dc_modes =3D =
info-&gt;edid_hdmi_rgb444_dc_modes;<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>drm_dbg_kms(connector-&gt;dev, =
"[CONNECTOR:%d:%s] HDMI sink does YCRCB444 in deep color.\n",<br><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;connector-&=
gt;base.id, connector-&gt;name);<br>@@ -6343,7 +6343,7 @@ static void =
drm_parse_hdmi_deep_color_info(struct drm_connector *connector,<br><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* Spec says that if any =
deep color mode is supported at all,<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* then deep color 36 bit =
must be supported.<br><span class=3D"Apple-tab-span" style=3D"white-space:=
 pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>*/<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(!(hdmi[6] &amp; DRM_EDID_HDMI_DC_36)) {<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(!(db-&gt;data[6] &amp; DRM_EDID_HDMI_DC_36)) {<br><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>drm_dbg_kms(connector-&gt;dev, "[CONNECTOR:%d:%s] HDMI sink =
should do DC_36, but does not!\n",<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;connector-&=
gt;base.id, connector-&gt;name);<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>}<br>@@ -6351,19 +6351,19 @@ =
static void drm_parse_hdmi_deep_color_info(struct drm_connector =
*connector,<br><br>/* HDMI Vendor-Specific Data Block (HDMI VSDB, =
H14b-VSDB) */<br>static void<br>-drm_parse_hdmi_vsdb_video(struct =
drm_connector *connector, const u8 =
*db)<br>+drm_parse_hdmi_vsdb_video(struct drm_connector *connector, =
const struct cea_db *db)<br>{<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>struct drm_display_info *info =3D =
&amp;connector-&gt;display_info;<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>u8 len =3D =
cea_db_payload_len(db);<br><br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>info-&gt;is_hdmi =3D =
true;<br><br>-<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>info-&gt;source_physical_address =3D (db[4] &lt;&lt; 8) | =
db[5];<br>+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>info-&gt;source_physical_address =3D (db-&gt;data[4] &lt;&lt; 8) =
| db-&gt;data[5];<br><br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (len &gt;=3D 6)<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>info-&gt;dvi_dual =3D db[6] &amp; 1;<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>info-&gt;dvi_dual =3D db-&gt;data[6] &amp; 1;<br><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if (len =
&gt;=3D 7)<br>-<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>info-&gt;max_tmds_clock =3D db[7] * 5000;<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>info-&gt;max_tmds_clock =3D db-&gt;data[7] * 5000;<br><br><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>/*<br><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-converted-space">&nbsp;</span>* Try to infer =
whether the sink supports HDMI infoframes.<br>@@ -6371,7 +6371,7 @@ =
drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 =
*db)<br><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-converted-space">&nbsp;</span>* HDMI =
infoframe support was first added in HDMI 1.4. Assume the sink<br><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* supports infoframes if =
HDMI_Video_present is set.<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>*/<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if (len =
&gt;=3D 8 &amp;&amp; db[8] &amp; BIT(5))<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if (len =
&gt;=3D 8 &amp;&amp; db-&gt;data[8] &amp; BIT(5))<br><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>info-&gt;has_hdmi_infoframe =3D true;<br><br><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>drm_dbg_kms(connector-&gt;dev, "[CONNECTOR:%d:%s] HDMI: DVI dual =
%d, max TMDS clock %d kHz\n",<br>@@ -6443,7 +6443,7 @@ static void =
drm_parse_cea_ext(struct drm_connector *connector,<br><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>const u8 =
*data =3D (const u8 *)db;<br><br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if =
(cea_db_is_hdmi_vsdb(db))<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	=
</span>drm_parse_hdmi_vsdb_video(connector, data);<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>drm_parse_hdmi_vsdb_video(connector, db);<br><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>else if =
(cea_db_is_hdmi_forum_vsdb(db) ||<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>cea_db_is_hdmi_forum_scdb(db)=
)<br><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>drm_parse_hdmi_forum_scds(connector, data);<br></blockquote><br =
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
display: inline !important;">Jani Nikula, =
Intel</span></div></blockquote></div><br></body></html>=

--Apple-Mail=_0077CD56-AB61-40C6-ACE1-3EA75817006A--
