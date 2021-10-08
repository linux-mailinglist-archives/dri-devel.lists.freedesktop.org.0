Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BC3426A6C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 14:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 608106F4F7;
	Fri,  8 Oct 2021 12:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2045.outbound.protection.outlook.com [40.107.96.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA846F4F7;
 Fri,  8 Oct 2021 12:08:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F47ZEfbHIhAD5XzvBykXyImLYt1EDAlrkrYqVyt1sm8Dg45EklQ9yqo08b8lccRsjouF47VI7i9kOwZTV2MXHMI7r7b6yTYNkxy/mjEfCg+zOeXTm5ifUlDGyg70w04zMGqrgpIv9X7NuN2xuFL7WU5rmG1EE6O4scd4csmFJ7qahoo8vvbPyV18VVw+txE3NzYSBTY515bF2Qc/mZE269dKYGz2T/FaDkXw93vYpXpfveGEiGm8QpOhudy4a0GZAd0AMQkleWl/WkeXRQtEBaHLNxM/yUrpBb9GmW04UZ0PqZguMq79qE/BCY4PhuTew2Y8QKNiuph/XPxNXacKEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFII85LxzxX/7RGqoZqG8OBNYCSjoXsK1UCYhjd6Y48=;
 b=RWKSGFOUh2pgBwCGXFygGCk5+JcCA3nuzB13jE0y2t5fAHzj/ZI+C0Xu4DI3f7Op1lA8ZKHOvKibTLNdLolSd9mNdNKb8IsWBwu3U1FJRKo0ya+2krtzAoCfiDG1Sb4pfnVtGKYPk2UOm3UDjki73Xbvw7qvsnuvwqEqJiMyZrb4c7bOIGnO7NzqBPcEmr9Whn6jaIt20lOWlwTUghAh/wPw4lscU5t7c1dvAgWD+qespJeMS/D5JZS1W9+BypX2xhcRvyQP4rvM/hHthdLfGKF7RU1SNabxjGGK0AaNR3Z8sqrmhZFPWrvIFXlMQn9U+e+K3hlkQIV1HU86FrInuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QFII85LxzxX/7RGqoZqG8OBNYCSjoXsK1UCYhjd6Y48=;
 b=junTtzcxmF5p+jhrc3R3chhSvYKIKho54r7Ni64yRtWBkzgjGIiV0W7e22+IK4b2w6f3d4Zk+ZSXqsM24ttuWLJAgBs8cDeRKYJzGPj6wSPOv+U5hu0jljpYuZdruaM369bVa+AmlJnumibUXmNnPC+E2wpdMTETXpFuoFc77i4=
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM8PR12MB5477.namprd12.prod.outlook.com (2603:10b6:8:35::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 12:08:50 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::555a:2980:a5c2:8d29]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::555a:2980:a5c2:8d29%8]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 12:08:50 +0000
From: "Das, Nirmoy" <Nirmoy.Das@amd.com>
To: Greg KH <gregkh@linuxfoundation.org>, Jani Nikula
 <jani.nikula@linux.intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 1/5] dri: cleanup debugfs error handling
Thread-Topic: [Intel-gfx] [PATCH 1/5] dri: cleanup debugfs error handling
Thread-Index: AQHXvCVOX+r98BpL20ibYh87C1bzDKvI2NmAgAAYK4CAAAxFEQ==
Date: Fri, 8 Oct 2021 12:08:50 +0000
Message-ID: <DM4PR12MB5136620C3B013850D11F44868BB29@DM4PR12MB5136.namprd12.prod.outlook.com>
References: <20211008091704.27094-1-nirmoy.das@amd.com>
 <87a6jjyhuo.fsf@intel.com> <YWAmZdRwnAt6wh9B@kroah.com>
In-Reply-To: <YWAmZdRwnAt6wh9B@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-10-08T12:08:49.915Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
suggested_attachment_session_id: 22cc0c61-7022-8a3b-531f-7027cd394c50
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a96f527c-8594-472e-7c6e-08d98a5463ae
x-ms-traffictypediagnostic: DM8PR12MB5477:
x-microsoft-antispam-prvs: <DM8PR12MB54771A539BA2F45911A1406C8BB29@DM8PR12MB5477.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1MGpKd2v4Rw7V4AqAq+B4XdXKKupD5X5uI+tvMu/l40I+7fy4h2xfAdoXtyn8wnppK+eXbO3llxoiqSuMUK7IVW9/xHalXBeQ31gOmzyXHL64gwws9nQjNZTohZYjV/q2PNzEG4Uq7W0g7U3dILWIc5CqGBP2ieuKDO/iKfO8iHnr1w8uhb6PCCuhmxa7AJvqUZvflneZ+ABhOmJ1hWM/EfsgAmGs4P1TARk7VbNxw81ifEvURoUoBte/ke0BDEULplJfjpMu84NGuvjtAH1TUhhlDj7PIkJqUp5EEvXd/KsFusVOiR1mmPPMxe2SPvnN4JLYZoUajZy4Y0xHuh76f1lU7y0X3bLpxEmJd6SxjCpX99Jrewj4V1IA4fE1SH2Lw9iSemiK2mQ0IoP8AoDklCnPOq8osO/xNSohVbCn8j7Ib6WsceeV2JPV37av+G8pFmISVBFnVXwf8d1Gi7ZZFJ4IrXB4M3jrUBo8UZD3l8GPgKBTbh7fi4h18lu4rf4V66rnKobqUPI524dQmRX++v0vvPf3Fk8Q7J42+4NTOGTpnz1ZgSnnllyBFvIq5cWUZ5u0ikxYxcOu4+A9ip68gXiC+dQaye+NkQHccYyNn++aN971+Ts2DrRffJ9Ok3OGKI8b7Un45q19goGWzLViVKaXRRa5G17u0VmDmTLNLrGgOtEUBTgx8s94VCulfU9tHqhyYs/Vs6PN4bP/0wq8w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(316002)(33656002)(86362001)(122000001)(53546011)(91956017)(66446008)(8936002)(64756008)(66556008)(66476007)(55016002)(186003)(2906002)(110136005)(54906003)(38100700002)(9686003)(7696005)(8676002)(38070700005)(52536014)(19627405001)(66946007)(26005)(76116006)(4326008)(5660300002)(6506007)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?up9KVVjHdEnMCu6KZ50m8jTWnjdESoWnqzeveWkGzvQ3HTM/T61vjRhRS9OW?=
 =?us-ascii?Q?SryXoWh1CqDmGpf5/w2Ph817rq8Rvlpg8vTdghNKeUY5hLYIeyX1OsDCDQVE?=
 =?us-ascii?Q?bOL3WhwS7VMh7VKd3qi93x1Pkqt8dEiIELAbjZtgG0Ls1RjaS6mTtieSzFrz?=
 =?us-ascii?Q?5IjLDP9axKXK2H86TOGghZdm0sw8XWtvSXk+SvMWOfhJLA7HzZ3rXE4Dwnzu?=
 =?us-ascii?Q?OVn1Qj8r7ziolgyJ7QwXH3jb5C0nPw6WupB2wS/wUiLY8krJ/EX29/BEeWCP?=
 =?us-ascii?Q?mj6PwfdQS7xl7TT2VsGNR/j9kYYTwgPlQEbgiOr2bDUMhr0Oj3k0aL6LVj3C?=
 =?us-ascii?Q?yqxNsSVDe+AzMseGFwBLV395X+zy2Vsj/H5cs8Bc/GvMSnxBddqYnBCtmvl6?=
 =?us-ascii?Q?Q6nMipcw9TDGx9TOES2LQEuS3dBExCXZZIT5J6+3hhSVZzqUG2gcBVF5BoPO?=
 =?us-ascii?Q?MwwSVIB2FfoVWvLpbxlbg17aJBLVn6aj2kYnkfoIqTKU5TLLeFA8zAYaNFYF?=
 =?us-ascii?Q?TgR8/q1DfnzxLn4JO50w0iSus/cYcoT6mnoRgBxq8VPUNZh49Rff4wuuuSvb?=
 =?us-ascii?Q?X/G89PHQS9ITo3yFQkDwbcVmTkXBkb9DZQMHCSUf02dy2isoTvjOkBHjqk2t?=
 =?us-ascii?Q?L7eHQf3mJrDFgO3kGBHIDjEzynKEx1zUXhh7FzWf4GVrQPWWk4eAGyulCKcq?=
 =?us-ascii?Q?PZ1NKevH14eLOwRhaakLAp1gU6HK4Pe0Ex+M0rCCuT04zgqUKmyRO+HGMoyR?=
 =?us-ascii?Q?hObFJyPts2e/Xvg5sMCQmQfmekzkwREWVme53S0QZionIsZwyksWx4sXi6q3?=
 =?us-ascii?Q?VqyRxmfgh7vEKb8A0k3onnw40E68iGcTdXw8tjm9fhQ660XueEFnmkxiCTsu?=
 =?us-ascii?Q?iKnZ0vbGNodyk2HS61Db95z63X5MciVIluApgk5KZdnT6K7CLuis+eJK6KQo?=
 =?us-ascii?Q?gJqX+EYZkjmuLVXq+MscCvCfz9/GTHzCXfttxf0DyFEg7RNqHueIi25KBJI7?=
 =?us-ascii?Q?+Iz+29PexaHFl4YXONIoh73LsD29bTKEBP8CeiL+HKjJdvJy/ZUNwav0mJP5?=
 =?us-ascii?Q?yZu+6Opo+aJcSQbIDlL4GN2MYiU8ACqtXf+FniTvGlNNOymNY5wemevJSSjv?=
 =?us-ascii?Q?dx0uDJJOn1T7M0JktQicnHjqmoAu0gpWxPoqMfMLQPnc1gOhxVRqLh5eAmm9?=
 =?us-ascii?Q?sYEcg4v557b3DunBNTOakXuyQVjbSVsdJgCPVPlRiyCI729XlN3CXECevJVD?=
 =?us-ascii?Q?WWAJRySTT7SQLMSqOFHucEw1P9cxnx9bvKNlQonHzmTX4KQ75xSXCBpj8QB4?=
 =?us-ascii?Q?wOo=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM4PR12MB5136620C3B013850D11F44868BB29DM4PR12MB5136namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a96f527c-8594-472e-7c6e-08d98a5463ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2021 12:08:50.2507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sYYsXyCN0utD5wZXgu1MFlyxTZZKPQQclTQdZjqlKUn38VQ9wqoxXu9WO7xcrnZNn576VEapWam1cbkS38n2nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5477
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

--_000_DM4PR12MB5136620C3B013850D11F44868BB29DM4PR12MB5136namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Thanks, Greg and Jani. So I have to do the exact opposite.

We do have some NULL dentry check in the drm code. I will remove those inst=
ead.

Regards,
Nirmoy
________________________________
From: Greg KH <gregkh@linuxfoundation.org>
Sent: Friday, October 8, 2021 1:07 PM
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Das, Nirmoy <Nirmoy.Das@amd.com>; dri-devel@lists.freedesktop.org <dri-=
devel@lists.freedesktop.org>; intel-gfx@lists.freedesktop.org <intel-gfx@li=
sts.freedesktop.org>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>=
; Maxime Ripard <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.d=
e>; David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH 1/5] dri: cleanup debugfs error handling

On Fri, Oct 08, 2021 at 12:40:47PM +0300, Jani Nikula wrote:
> On Fri, 08 Oct 2021, Nirmoy Das <nirmoy.das@amd.com> wrote:
> > Debugfs API returns encoded error instead of NULL.
> > This patch cleanups drm debugfs error handling to
> > properly set dri and its minor's root dentry to NULL.
> >
> > Also do not error out if dri/minor debugfs directory
> > creation fails as a debugfs error is not a fatal error.
>
> Cc: Greg
>
> I thought this is the opposite of what Greg's been telling everyone to
> do with debugfs.

Yes, that is not good.

You should never care about the result of a debugfs_create* call.  Just
take the result, and if it is a directory, save it off to use it for
creating a file, no need to check anything.

And then throw it away, later, when you want to remove the directory,
look it up with a call to debugfs_lookup() and pass that to
debugfs_remove() (which does so recursively).

There should never be a need to save, or check, the result of any
debugfs call.  If so, odds are it is being used incorrectly.

thanks,

greg k-h

--_000_DM4PR12MB5136620C3B013850D11F44868BB29DM4PR12MB5136namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Thanks, Greg and Jani. So I have to do the exact opposite.&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
We do have some NULL dentry check in the drm code. I will remove those inst=
ead.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Nirmoy</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Greg KH &lt;gregkh@li=
nuxfoundation.org&gt;<br>
<b>Sent:</b> Friday, October 8, 2021 1:07 PM<br>
<b>To:</b> Jani Nikula &lt;jani.nikula@linux.intel.com&gt;<br>
<b>Cc:</b> Das, Nirmoy &lt;Nirmoy.Das@amd.com&gt;; dri-devel@lists.freedesk=
top.org &lt;dri-devel@lists.freedesktop.org&gt;; intel-gfx@lists.freedeskto=
p.org &lt;intel-gfx@lists.freedesktop.org&gt;; Maarten Lankhorst &lt;maarte=
n.lankhorst@linux.intel.com&gt;; Maxime Ripard &lt;mripard@kernel.org&gt;;
 Thomas Zimmermann &lt;tzimmermann@suse.de&gt;; David Airlie &lt;airlied@li=
nux.ie&gt;; Daniel Vetter &lt;daniel@ffwll.ch&gt;<br>
<b>Subject:</b> Re: [Intel-gfx] [PATCH 1/5] dri: cleanup debugfs error hand=
ling</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Fri, Oct 08, 2021 at 12:40:47PM +0300, Jani Nik=
ula wrote:<br>
&gt; On Fri, 08 Oct 2021, Nirmoy Das &lt;nirmoy.das@amd.com&gt; wrote:<br>
&gt; &gt; Debugfs API returns encoded error instead of NULL.<br>
&gt; &gt; This patch cleanups drm debugfs error handling to<br>
&gt; &gt; properly set dri and its minor's root dentry to NULL.<br>
&gt; &gt;<br>
&gt; &gt; Also do not error out if dri/minor debugfs directory<br>
&gt; &gt; creation fails as a debugfs error is not a fatal error.<br>
&gt; <br>
&gt; Cc: Greg<br>
&gt; <br>
&gt; I thought this is the opposite of what Greg's been telling everyone to=
<br>
&gt; do with debugfs.<br>
<br>
Yes, that is not good.<br>
<br>
You should never care about the result of a debugfs_create* call.&nbsp; Jus=
t<br>
take the result, and if it is a directory, save it off to use it for<br>
creating a file, no need to check anything.<br>
<br>
And then throw it away, later, when you want to remove the directory,<br>
look it up with a call to debugfs_lookup() and pass that to<br>
debugfs_remove() (which does so recursively).<br>
<br>
There should never be a need to save, or check, the result of any<br>
debugfs call.&nbsp; If so, odds are it is being used incorrectly.<br>
<br>
thanks,<br>
<br>
greg k-h<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM4PR12MB5136620C3B013850D11F44868BB29DM4PR12MB5136namp_--
