Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E35761296C
	for <lists+dri-devel@lfdr.de>; Sun, 30 Oct 2022 10:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7665810E08B;
	Sun, 30 Oct 2022 09:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Sat, 29 Oct 2022 08:37:14 UTC
Received: from outboundhk.mxmail.xiaomi.com (outboundhk.mxmail.xiaomi.com
 [207.226.244.122])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0744B10E254;
 Sat, 29 Oct 2022 08:37:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.95,223,1661788800"; d="scan'208,217";a="53076940"
Received: from hk-mbx02.mioffice.cn (HELO xiaomi.com) ([10.56.8.122])
 by outboundhk.mxmail.xiaomi.com with ESMTP; 29 Oct 2022 16:29:59 +0800
Received: from BJ-MBX17.mioffice.cn (10.237.8.137) by HK-MBX02.mioffice.cn
 (10.56.8.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Sat, 29 Oct
 2022 16:30:00 +0800
Received: from BJ-MBX18.mioffice.cn (10.237.8.138) by BJ-MBX17.mioffice.cn
 (10.237.8.137) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Sat, 29 Oct
 2022 16:30:00 +0800
Received: from BJ-MBX18.mioffice.cn ([fe80::614c:39ef:1920:7898]) by
 BJ-MBX18.mioffice.cn ([fe80::614c:39ef:1920:7898%16]) with mapi id
 15.02.0986.029; Sat, 29 Oct 2022 16:30:00 +0800
From: =?gb2312?B?yfLR1Lfl?= <shenyanfeng@xiaomi.com>
To: "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>
Subject: Subject: [PATCH] driver: gpu: add failure check for ftell
Thread-Topic: Subject: [PATCH] driver: gpu: add failure check for ftell
Thread-Index: AQHY62zacz3Gu5ZsB0W1NT/L5A964A==
Date: Sat, 29 Oct 2022 08:30:00 +0000
Message-ID: <dcbdea48b4554f1989b2b7c6ebc9e32d@xiaomi.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.8.11]
Content-Type: multipart/alternative;
 boundary="_000_dcbdea48b4554f1989b2b7c6ebc9e32dxiaomicom_"
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 30 Oct 2022 09:26:02 +0000
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_dcbdea48b4554f1989b2b7c6ebc9e32dxiaomicom_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

YWRkIHJldHVybi12YWx1ZSBjaGVjayBvZiBmdGVsbCB0byBpbXByb3ZlIHJvYnVzdG5lc3MoYW5k
IGF2b2lkIGFibm9ybWFsIGJlaGF2aW9yKQ0KDQpTaWduZWQtb2ZmLWJ5OiBTUGVhayA8c3BlYWtz
aGVuQDE2My5jb20+DQpTaWduZWQtb2ZmLWJ5OiBzaGVueWFuZmVuZyA8c2hlbnlhbmZlbmdAeGlh
b21pLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vbWtyZWd0YWJsZS5jIHwgNSAr
KystLQ0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL21rcmVndGFibGUuYyBiL2RyaXZl
cnMvZ3B1L2RybS9yYWRlb24vbWtyZWd0YWJsZS5jDQppbmRleCA1MmE3MjQ2ZmUuLmMzMWM1OGU1
ZiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vbWtyZWd0YWJsZS5jDQorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL21rcmVndGFibGUuYw0KQEAgLTE5Myw2ICsxOTMsNyBA
QCBzdGF0aWMgaW50IHBhcnNlcl9hdXRoKHN0cnVjdCB0YWJsZSAqdCwgY29uc3QgY2hhciAqZmls
ZW5hbWUpDQogIHJlZ21hdGNoX3QgbWF0Y2hbNF07DQogIGNoYXIgYnVmWzEwMjRdOw0KICBzaXpl
X3QgZW5kOw0KKyBsb25nIHBvczsNCiAgaW50IGxlbjsNCiAgaW50IGRvbmUgPSAwOw0KICBpbnQg
cjsNCkBAIC0yMjgsMTIgKzIyOSwxMiBAQCBzdGF0aWMgaW50IHBhcnNlcl9hdXRoKHN0cnVjdCB0
YWJsZSAqdCwgY29uc3QgY2hhciAqZmlsZW5hbWUpDQogIGxhc3RfcmVnID0gc3RydG9sKGxhc3Rf
cmVnX3MsIE5VTEwsIDE2KTsNCg0KICBkbyB7DQotIGlmIChmZ2V0cyhidWYsIDEwMjQsIGZpbGUp
ID09IE5VTEwpIHsNCisgaWYgKChmZ2V0cyhidWYsIDEwMjQsIGZpbGUpID09IE5VTEwpIHx8IChw
b3MgPSBmdGVsbChmaWxlKSkgPCAwKSB7DQogIGZjbG9zZShmaWxlKTsNCiAgcmV0dXJuIC0xOw0K
ICB9DQogIGxlbiA9IHN0cmxlbihidWYpOw0KLSBpZiAoZnRlbGwoZmlsZSkgPT0gZW5kKQ0KKyBp
ZiAocG9zID09IGVuZCkNCiAgZG9uZSA9IDE7DQogIGlmIChsZW4pIHsNCiAgciA9IHJlZ2V4ZWMo
Jm1hc2tfcmV4LCBidWYsIDQsIG1hdGNoLCAwKTsNCi0tDQoyLjM3LjINCg0KIy8qKioqKiqxvtPK
vP68sMbkuL28/rqs09DQocPXuavLvrXEsaPD3NDFz6KjrL32z97T2reiy824+MnPw+a12Na31tDB
0LP2tcS49sjLu/LIutfpoaO9+9a5yM66zsbky/vIy9LUyM66ztDOyr3KudPDo6iw/MCotauyu8/e
09rIq7K/u/Kyv7fWtdjQucK2oaK4tNbGoaK78smit6KjqbG+08q8/tbQtcTQxc+ioaPI57n7xPq0
7crVwcuxvtPKvP6jrMfrxPrBory0tee7sLvy08q8/s2o1qq3orz+yMuyosm+s/2xvtPKvP6joSBU
aGlzIGUtbWFpbCBhbmQgaXRzIGF0dGFjaG1lbnRzIGNvbnRhaW4gY29uZmlkZW50aWFsIGluZm9y
bWF0aW9uIGZyb20gWElBT01JLCB3aGljaCBpcyBpbnRlbmRlZCBvbmx5IGZvciB0aGUgcGVyc29u
IG9yIGVudGl0eSB3aG9zZSBhZGRyZXNzIGlzIGxpc3RlZCBhYm92ZS4gQW55IHVzZSBvZiB0aGUg
aW5mb3JtYXRpb24gY29udGFpbmVkIGhlcmVpbiBpbiBhbnkgd2F5IChpbmNsdWRpbmcsIGJ1dCBu
b3QgbGltaXRlZCB0bywgdG90YWwgb3IgcGFydGlhbCBkaXNjbG9zdXJlLCByZXByb2R1Y3Rpb24s
IG9yIGRpc3NlbWluYXRpb24pIGJ5IHBlcnNvbnMgb3RoZXIgdGhhbiB0aGUgaW50ZW5kZWQgcmVj
aXBpZW50KHMpIGlzIHByb2hpYml0ZWQuIElmIHlvdSByZWNlaXZlIHRoaXMgZS1tYWlsIGluIGVy
cm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgYnkgcGhvbmUgb3IgZW1haWwgaW1tZWRpYXRl
bHkgYW5kIGRlbGV0ZSBpdCEqKioqKiovIw0K

--_000_dcbdea48b4554f1989b2b7c6ebc9e32dxiaomicom_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p></p>
<div>
<div></div>
<div>add return-value check of ftell to improve robustness(and avoid abnorm=
al behavior)</div>
<div><br>
</div>
<div>Signed-off-by: SPeak &lt;speakshen@163.com&gt;</div>
<div><span style=3D"font-family: Calibri, Helvetica, sans-serif, EmojiFont,=
 &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji,=
 &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols; font=
-size: 16px;">Signed-off-by: shenyanfeng &lt;shenyanfeng@xiaomi.com&gt;</sp=
an><br>
</div>
<div>---</div>
<div>&nbsp;drivers/gpu/drm/radeon/mkregtable.c | 5 &#43;&#43;&#43;--</div>
<div>&nbsp;1 file changed, 3 insertions(&#43;), 2 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/drivers/gpu/drm/radeon/mkregtable.c b/drivers/gpu/drm/rad=
eon/mkregtable.c</div>
<div>index 52a7246fe..c31c58e5f 100644</div>
<div>--- a/drivers/gpu/drm/radeon/mkregtable.c</div>
<div>&#43;&#43;&#43; b/drivers/gpu/drm/radeon/mkregtable.c</div>
<div>@@ -193,6 &#43;193,7 @@ static int parser_auth(struct table *t, const =
char *filename)</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>regmatch_t match[4];</di=
v>
<div>&nbsp;<span style=3D"white-space:pre"> </span>char buf[1024];</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>size_t end;</div>
<div>&#43;<span style=3D"white-space:pre"> </span>long pos;</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>int len;</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>int done =3D 0;</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>int r;</div>
<div>@@ -228,12 &#43;229,12 @@ static int parser_auth(struct table *t, cons=
t char *filename)</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>last_reg =3D strtol(last=
_reg_s, NULL, 16);</div>
<div>&nbsp;</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>do {</div>
<div>-<span style=3D"white-space:pre"> </span>if (fgets(buf, 1024, file) =
=3D=3D NULL) {</div>
<div>&#43;<span style=3D"white-space:pre"> </span>if ((fgets(buf, 1024, fil=
e) =3D=3D NULL) || (pos =3D ftell(file)) &lt; 0) {</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>fclose(file);</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>return -1;</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>}</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>len =3D strlen(buf);</di=
v>
<div>-<span style=3D"white-space:pre"> </span>if (ftell(file) =3D=3D end)</=
div>
<div>&#43;<span style=3D"white-space:pre"> </span>if (pos =3D=3D end)</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>done =3D 1;</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>if (len) {</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>r =3D regexec(&amp;mask_=
rex, buf, 4, match, 0);</div>
<div>--&nbsp;</div>
<div>2.37.2</div>
</div>
<p></p>
</div>
#/******=B1=BE=D3=CA=BC=FE=BC=B0=C6=E4=B8=BD=BC=FE=BA=AC=D3=D0=D0=A1=C3=D7=
=B9=AB=CB=BE=B5=C4=B1=A3=C3=DC=D0=C5=CF=A2=A3=AC=BD=F6=CF=DE=D3=DA=B7=A2=CB=
=CD=B8=F8=C9=CF=C3=E6=B5=D8=D6=B7=D6=D0=C1=D0=B3=F6=B5=C4=B8=F6=C8=CB=BB=F2=
=C8=BA=D7=E9=A1=A3=BD=FB=D6=B9=C8=CE=BA=CE=C6=E4=CB=FB=C8=CB=D2=D4=C8=CE=BA=
=CE=D0=CE=CA=BD=CA=B9=D3=C3=A3=A8=B0=FC=C0=A8=B5=AB=B2=BB=CF=DE=D3=DA=C8=AB=
=B2=BF=BB=F2=B2=BF=B7=D6=B5=D8=D0=B9=C2=B6=A1=A2=B8=B4=D6=C6=A1=A2=BB=F2=C9=
=A2=B7=A2=A3=A9=B1=BE=D3=CA=BC=FE=D6=D0=B5=C4=D0=C5=CF=A2=A1=A3=C8=E7=B9=FB=
=C4=FA=B4=ED=CA=D5=C1=CB=B1=BE=D3=CA=BC=FE=A3=AC=C7=EB=C4=FA=C1=A2=BC=B4=B5=
=E7=BB=B0=BB=F2=D3=CA=BC=FE=CD=A8=D6=AA=B7=A2=BC=FE=C8=CB=B2=A2=C9=BE=B3=FD=
=B1=BE=D3=CA=BC=FE=A3=A1 This e-mail and its attachments contain confidenti=
al information from XIAOMI, which is intended only for the person or entity=
 whose address
 is listed above. Any use of the information contained herein in any way (i=
ncluding, but not limited to, total or partial disclosure, reproduction, or=
 dissemination) by persons other than the intended recipient(s) is prohibit=
ed. If you receive this e-mail in
 error, please notify the sender by phone or email immediately and delete i=
t!******/#
</body>
</html>

--_000_dcbdea48b4554f1989b2b7c6ebc9e32dxiaomicom_--
