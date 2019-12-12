Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 828A911C490
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 05:04:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE516EC48;
	Thu, 12 Dec 2019 04:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700040.outbound.protection.outlook.com [40.107.70.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2BCF6EC48;
 Thu, 12 Dec 2019 04:04:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NG+RV/nT51h7naHJJTzB4gGN/tvAVLNEF9/Hp7Pcn7a8MH+6wh1HT3cuCOY/f7DOqDoOU22fn636WtNOiCH6GoSGBzPH3Wa363WStmvu0x5rVbeZ5yxLLhMUbH4RkdqwRyeCKWAbK9SlqL38qzswM7uX4Pktua8EQUXUML5Nxo/u77NOgkfJ3vLoawWoDPEVHvwv+DMH96xcA4Et8PUq4VFknrvLpJiQI+UAn1HYQYx5qwI2SMKUb0LtAb6JezFOmxPdyUMn7b4HxhyG9icMEDsCSFIY+PVlZXzJGAlcaeoT8iDK9ZsmvjL+STrIBGFMmhS4IuBs1sF0lxJR5a8HEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jaKvSTwPa07NiPwxTXXd+HkiwFoNHkfzLqbbDnzsTw=;
 b=OO8DE3gB6EKia8+p6WVfBZ6SECcKlFfWTYEGbuC9Tb/eG8W968i00utM2/1I2ZKeMzlHtrmUWlyZ/exgvFuwJVNhoDkCtI3BvlyElrVBk0LZZ3Xq27sZB/x42Q/ZkSd21hTMjrYdTmwKA7aU2aj0UGwEghrX5mZs+qTLXmlJsZCofFAA7hlv29iWrg84Txtk7mqntGaTaz95jFPW6aE9pGlNdIfipY3Rk49a/L5zrXZaPWDUALJpQzwXGDfwz/IGMUVVTGO2PupnNPxouNh0/M8vRzo4i7w2+RxLOm3AZec1gnlWOLnhGWTNU9hLfGbgIV9Yje7zzcWOPYk8o0HN0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jaKvSTwPa07NiPwxTXXd+HkiwFoNHkfzLqbbDnzsTw=;
 b=NuiPLSQJzJ/+sq6h73gcBs69+yLXKXLpXVxKIDVTwFKhvcgRN3m+OPAM69+43czA4+k1WC8/MqHt6N/oqvSmcTWUilJ4/vy6X7MK7FjJFWLyImPYjqz92gYTYICW6wAPs5KGhrcCYwqq4ujJw1jZuD8iQDP5lfkrIGrwdmLtSRQ=
Received: from MN2PR12MB4285.namprd12.prod.outlook.com (52.135.49.140) by
 MN2PR12MB3069.namprd12.prod.outlook.com (20.178.241.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Thu, 12 Dec 2019 04:04:34 +0000
Received: from MN2PR12MB4285.namprd12.prod.outlook.com
 ([fe80::dc02:3d41:a510:98f6]) by MN2PR12MB4285.namprd12.prod.outlook.com
 ([fe80::dc02:3d41:a510:98f6%6]) with mapi id 15.20.2538.012; Thu, 12 Dec 2019
 04:04:34 +0000
From: "Ma, Le" <Le.Ma@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [RESEND PATCH 2/5] drm: Add Reusable task barrier.
Thread-Topic: [RESEND PATCH 2/5] drm: Add Reusable task barrier.
Thread-Index: AQHVsGMKqJz7FgZm1UaC01BbgVrHa6e10/5w
Date: Thu, 12 Dec 2019 04:04:34 +0000
Message-ID: <MN2PR12MB4285F713BEE4E4BC2E3F3F39F6550@MN2PR12MB4285.namprd12.prod.outlook.com>
References: <1576096732-3596-1-git-send-email-andrey.grodzovsky@amd.com>
 <1576096732-3596-2-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1576096732-3596-2-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2019-12-12T04:04:31Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=04c6abac-eeaf-4fb3-a0ed-0000818c7f85;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2019-12-12T04:04:31Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: fc56414b-89e8-4f5d-811a-0000eacd8a93
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: spf=none (sender IP is ) smtp.mailfrom=Le.Ma@amd.com; 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 91f96056-e91e-4a4a-aca9-08d77eb865c5
x-ms-traffictypediagnostic: MN2PR12MB3069:|MN2PR12MB3069:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3069EFA0F4CFB2565C47D7FDF6550@MN2PR12MB3069.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(189003)(13464003)(199004)(7696005)(81166006)(8936002)(6506007)(81156014)(26005)(5660300002)(71200400001)(52536014)(8676002)(53546011)(4326008)(86362001)(478600001)(450100002)(55016002)(186003)(54906003)(316002)(66446008)(2906002)(66556008)(64756008)(66946007)(76116006)(66476007)(33656002)(9686003)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3069;
 H:MN2PR12MB4285.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KpaeQjCt/y/zV8wFi0cnsCaGFBdel7X6JOVhYXdUS+F935aWNVjKguWgaT9Emubnlji4s/S2zHd7DA0jYDVt1g8kpzlPqDXA7TUZkL+hfL52IKiQB0ppsmYO9lEcSWX/Au95HANcb/i7/zCBPTBBRkea0bwwok0Vh8SoPpbylhhlwNhbm1RqlCIEVdgjKzkf1HHKqFLm3fd62GiY6vWsWyDoG9zXAWcaKjD5m+/IV+s6DdAjuocAU0KmpysYNSlXCMT5wL+P+pR7F0tlwV5jDpgwNX1FFRw9BpwKjia9O+w07ssIKIapCxcefWoCwEci7WVKodrmwO4Co85dsPLvJdhwjeVNyg5yow3DCrEBBOloT0WLr3d0mXIO4ZE88PrlT+yBW8pvNyHvd4nkkv10pH2H1cWXyIrxZuIutAjjuaxhZsH42BdL3e9zC3Z8ESuaK4eB/aJJUadVM9/bb2TtB9kfKsEgofNCaLj/EU5i+A9RZHKpkbn7MpQxm6k09tArEcbwwSYyOv5US0JGL/5mc7KfD68tnWQRK2Tg9IN0mz0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91f96056-e91e-4a4a-aca9-08d77eb865c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 04:04:34.1605 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8QSLR4RSOkey6tGtcEu4jNaHyOQrMvhMzlOp1tUMJMIWTrUyhUJQv4vkLH+7r0Fg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3069
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============1109956574=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1109956574==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB4285F713BEE4E4BC2E3F3F39F6550MN2PR12MB4285namp_"

--_000_MN2PR12MB4285F713BEE4E4BC2E3F3F39F6550MN2PR12MB4285namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]






-----Original Message-----
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Sent: Thursday, December 12, 2019 4:39 AM
To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Ma, Le <Le.Ma@amd.com>;=
 Zhang, Hawking <Hawking.Zhang@amd.com>; Quan, Evan <Evan.Quan@amd.com>; Gr=
odzovsky, Andrey <Andrey.Grodzovsky@amd.com>
Subject: [RESEND PATCH 2/5] drm: Add Reusable task barrier.



It is used to synchronize N threads at a rendevouz point before execution o=
f critical code that has to be started by all the threads at approximatly t=
he same time.



Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com<mailto:andrey.g=
rodzovsky@amd.com>>

---

include/drm/task_barrier.h | 106 ++++++++++++++++++++++++++++++++++++++++++=
+++

1 file changed, 106 insertions(+)

create mode 100644 include/drm/task_barrier.h



diff --git a/include/drm/task_barrier.h b/include/drm/task_barrier.h new fi=
le mode 100644 index 0000000..81fb0f7

--- /dev/null

+++ b/include/drm/task_barrier.h

@@ -0,0 +1,106 @@

+/*

+ * Copyright 2019 Advanced Micro Devices, Inc.

+ *

+ * Permission is hereby granted, free of charge, to any person

+obtaining a

+ * copy of this software and associated documentation files (the

+"Software"),

+ * to deal in the Software without restriction, including without

+limitation

+ * the rights to use, copy, modify, merge, publish, distribute,

+sublicense,

+ * and/or sell copies of the Software, and to permit persons to whom

+the

+ * Software is furnished to do so, subject to the following conditions:

+ *

+ * The above copyright notice and this permission notice shall be

+included in

+ * all copies or substantial portions of the Software.

+ *

+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,

+EXPRESS OR

+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF

+MERCHANTABILITY,

+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT

+SHALL

+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM,

+DAMAGES OR

+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR

+OTHERWISE,

+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE

+OR

+ * OTHER DEALINGS IN THE SOFTWARE.

+ *

+ */

+#include <linux/semaphore.h>

+#include <linux/atomic.h>

+

+/*

+ * Reusable 2 PHASE task barrier (randevouz point) implementation for N ta=
sks.

+ * Based on the Little book of sempahores -

+https://greenteapress.com/wp/semaphores/

+ */

+

+

+

+#ifndef DRM_TASK_BARRIER_H_

+#define DRM_TASK_BARRIER_H_

+



[Le]: It might be better to prefix "drm_" to the functions and structure be=
low, even this header file name.



+/*

+ * Represents an instance of a task barrier.

+ */

+struct task_barrier {

+          unsigned int n;

[Le]: We can define it as signed type here for more common use.

+          atomic_t count;

+          struct semaphore enter_turnstile;

+          struct semaphore exit_turnstile;

+};

+

+static inline void task_barrier_signal_turnstile(struct semaphore *turnsti=
le,

+                                                                      unsi=
gned int n)

+{

+          int i;

+

+          for (i =3D 0 ; i < n; i++)

+                      up(turnstile);

+}

+

+static inline void task_barrier_init(struct task_barrier *tb) {

+          tb->n =3D 0;

+          atomic_set(&tb->count, 0);

+          sema_init(&tb->enter_turnstile, 0);

+          sema_init(&tb->exit_turnstile, 0);

+}

+

+static inline void task_barrier_add_task(struct task_barrier *tb) {

+          tb->n++;

+}

+

+static inline void task_barrier_rem_task(struct task_barrier *tb) {

+          tb->n--;

+}

+

+/*

+ * Lines up all the threads BEFORE the critical point.

+ *

+ * When all thread passed this code the entry barrier is back to locked st=
ate.

+ */

+static inline void task_barrier_enter(struct task_barrier *tb) {

+          if (atomic_inc_return(&tb->count) =3D=3D tb->n)

+                      task_barrier_signal_turnstile(&tb->enter_turnstile, =
tb->n);

+

+          down(&tb->enter_turnstile);

+}

+

+/*

+ * Lines up all the threads AFTER the critical point.

+ *

+ * This function is used to avoid any one thread running ahead of the

+reset if

[Le]: No need to mention "reset" here.



With the above addressed, Acked-by: Le Ma Le.Ma@amd.com<mailto:Le.Ma@amd.co=
m>



Regards,

Ma Le

+ * the barrier is used in a loop (repeatedly) .

+ */

+static inline void task_barrier_exit(struct task_barrier *tb) {

+          if (atomic_dec_return(&tb->count) =3D=3D 0)

+                      task_barrier_signal_turnstile(&tb->exit_turnstile, t=
b->n);

+

+          down(&tb->exit_turnstile);

+}

+

+static inline void task_barrier_full(struct task_barrier *tb) {

+          task_barrier_enter(tb);

+          task_barrier_exit(tb);

+}

+

+#endif

--

2.7.4



--_000_MN2PR12MB4285F713BEE4E4BC2E3F3F39F6550MN2PR12MB4285namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:14.0pt;
	font-family:"Calibri",sans-serif;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
p.msipheadera92e061b, li.msipheadera92e061b, div.msipheadera92e061b
	{mso-style-name:msipheadera92e061b;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle21
	{mso-style-type:personal-compose;
	font-family:"Arial",sans-serif;
	color:#0078D7;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"msipheadera92e061b" style=3D"margin:0in;margin-bottom:.0001pt">=
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;co=
lor:#0078D7">[AMD Official Use Only - Internal Distribution Only]</span><o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">-----Original Message-----<br>
From: Andrey Grodzovsky &lt;andrey.grodzovsky@amd.com&gt; <br>
Sent: Thursday, December 12, 2019 4:39 AM<br>
To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org<br>
Cc: Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Ma, Le &lt;Le.Ma@=
amd.com&gt;; Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;; Quan, Evan &lt;E=
van.Quan@amd.com&gt;; Grodzovsky, Andrey &lt;Andrey.Grodzovsky@amd.com&gt;<=
br>
Subject: [RESEND PATCH 2/5] drm: Add Reusable task barrier.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">It is used to synchronize N threads at a rendevou=
z point before execution of critical code that has to be started by all the=
 threads at approximatly the same time.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Signed-off-by: Andrey Grodzovsky &lt;<a href=3D"m=
ailto:andrey.grodzovsky@amd.com"><span style=3D"color:windowtext;text-decor=
ation:none">andrey.grodzovsky@amd.com</span></a>&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">---<o:p></o:p></p>
<p class=3D"MsoPlainText">include/drm/task_barrier.h | 106 &#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">1 file changed, 106 insertions(&#43;)<o:p></o:p><=
/p>
<p class=3D"MsoPlainText">create mode 100644 include/drm/task_barrier.h<o:p=
></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">diff --git a/include/drm/task_barrier.h b/include=
/drm/task_barrier.h new file mode 100644 index 0000000..81fb0f7<o:p></o:p><=
/p>
<p class=3D"MsoPlainText">--- /dev/null<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&#43;&#43; b/include/drm/task_barrier.h<o:p>=
</o:p></p>
<p class=3D"MsoPlainText">@@ -0,0 &#43;1,106 @@<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;/*<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; * Copyright 2019 Advanced Micro Devices, In=
c.<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; *<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; * Permission is hereby granted, free of cha=
rge, to any person
<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;obtaining a<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; * copy of this software and associated docu=
mentation files (the
<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&quot;Software&quot;),<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; * to deal in the Software without restricti=
on, including without
<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;limitation<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; * the rights to use, copy, modify, merge, p=
ublish, distribute,
<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;sublicense,<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; * and/or sell copies of the Software, and t=
o permit persons to whom
<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;the<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; * Software is furnished to do so, subject t=
o the following conditions:<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; *<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; * The above copyright notice and this permi=
ssion notice shall be
<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;included in<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; * all copies or substantial portions of the=
 Software.<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; *<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; * THE SOFTWARE IS PROVIDED &quot;AS IS&quot=
;, WITHOUT WARRANTY OF ANY KIND,
<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;EXPRESS OR<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; * IMPLIED, INCLUDING BUT NOT LIMITED TO THE=
 WARRANTIES OF
<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;MERCHANTABILITY,<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; * FITNESS FOR A PARTICULAR PURPOSE AND NONI=
NFRINGEMENT.&nbsp; IN NO EVENT
<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;SHALL<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE L=
IABLE FOR ANY CLAIM,
<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;DAMAGES OR<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; * OTHER LIABILITY, WHETHER IN AN ACTION OF =
CONTRACT, TORT OR
<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;OTHERWISE,<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; * ARISING FROM, OUT OF OR IN CONNECTION WIT=
H THE SOFTWARE OR THE USE
<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;OR<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; * OTHER DEALINGS IN THE SOFTWARE.<o:p></o:p=
></p>
<p class=3D"MsoPlainText">&#43; *<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; */<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;#include &lt;linux/semaphore.h&gt;<o:p></o:p=
></p>
<p class=3D"MsoPlainText">&#43;#include &lt;linux/atomic.h&gt;<o:p></o:p></=
p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;/*<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; * Reusable 2 PHASE task barrier (randevouz =
point) implementation for N tasks.<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; * Based on the Little book of sempahores - =
<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;https://greenteapress.com/wp/semaphores/<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&#43; */<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;#ifndef DRM_TASK_BARRIER_H_<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;#define DRM_TASK_BARRIER_H_<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText"><span style=3D"color:black"><o:p>&nbsp;</o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span style=3D"color:#203864">[Le]: It might be b=
etter to prefix &#8220;drm_&#8221; to the functions and structure below, ev=
en this header file name.
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black"><o:p>&nbsp;</o:p></sp=
an></p>
<p class=3D"MsoPlainText">&#43;/*<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; * Represents an instance of a task barrier.=
<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; */<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;struct task_barrier {<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; unsigned int n;<o:p></o:p></p>
<p class=3D"MsoPlainText"><span style=3D"color:#203864">[Le]: We can define=
 it as signed type here for more common use.<o:p></o:p></span></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; atomic_t count;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct semaphore enter_turnstile;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; struct semaphore exit_turnstile;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;};<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;static inline void task_barrier_signal_turns=
tile(struct semaphore *turnstile,<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsi=
gned int n)<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;{<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; int i;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; for (i =3D 0 ; i &lt; n; i&#43;&#43;)<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; up(turnstile);<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;}<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;static inline void task_barrier_init(struct =
task_barrier *tb) {<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; tb-&gt;n =3D 0;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; atomic_set(&amp;tb-&gt;count, 0);<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; sema_init(&amp;tb-&gt;enter_turnstile, 0);<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; sema_init(&amp;tb-&gt;exit_turnstile, 0);<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;}<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;static inline void task_barrier_add_task(str=
uct task_barrier *tb) {<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; tb-&gt;n&#43;&#43;;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;}<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;static inline void task_barrier_rem_task(str=
uct task_barrier *tb) {<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; tb-&gt;n--;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;}<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;/*<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; * Lines up all the threads BEFORE the criti=
cal point.<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; *<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; * When all thread passed this code the entr=
y barrier is back to locked state.<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; */<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;static inline void task_barrier_enter(struct=
 task_barrier *tb) {<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (atomic_inc_return(&amp;tb-&gt;count) =3D=3D tb-&gt;n)<o:p></=
o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; task_barrier_signal_turnstile(&amp;tb-&gt;enter_turnstile, tb-&gt;n=
);<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; down(&amp;tb-&gt;enter_turnstile);<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;}<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;/*<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; * Lines up all the threads AFTER the critic=
al point.<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; *<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; * This function is used to avoid any one th=
read running ahead of the
<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;reset if<o:p></o:p></p>
<p class=3D"MsoPlainText"><span style=3D"color:#203864">[Le]: No need to me=
ntion &#8220;reset&#8221; here.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#203864"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#203864">With the above addr=
essed, Acked-by: Le Ma
<a href=3D"mailto:Le.Ma@amd.com"><span style=3D"color:#033160">Le.Ma@amd.co=
m</span></a><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#203864"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#203864">Regards,<o:p></o:p>=
</span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#203864">Ma Le<o:p></o:p></s=
pan></p>
<p class=3D"MsoPlainText">&#43; * the barrier is used in a loop (repeatedly=
) .<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43; */<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;static inline void task_barrier_exit(struct =
task_barrier *tb) {<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (atomic_dec_return(&amp;tb-&gt;count) =3D=3D 0)<o:p></o:p></p=
>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; task_barrier_signal_turnstile(&amp;tb-&gt;exit_turnstile, tb-&gt;n)=
;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; down(&amp;tb-&gt;exit_turnstile);<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;}<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;static inline void task_barrier_full(struct =
task_barrier *tb) {<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; task_barrier_enter(tb);<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; task_barrier_exit(tb);<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;}<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&#43;#endif<o:p></o:p></p>
<p class=3D"MsoPlainText">--<o:p></o:p></p>
<p class=3D"MsoPlainText">2.7.4<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_MN2PR12MB4285F713BEE4E4BC2E3F3F39F6550MN2PR12MB4285namp_--

--===============1109956574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1109956574==--
