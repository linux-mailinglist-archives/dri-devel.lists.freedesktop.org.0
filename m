Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 270C8426B5F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 14:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0E46E0ED;
	Fri,  8 Oct 2021 12:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C51F6E0ED
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 12:57:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYsBR39RQLoEMdgCCS5zSbpAC/P1ewNkL7XDwtk6GXBK/9QSQtVr59VeDeE9+Ifs1crZaiDRWMzVQgjoIa+Hq608ZUKwdCP+ktwNTKkkN52ApU/cpKx1PzrUT5vdiuM/ZCQdoHRhAubNnjB5YQRchHUTHDEmHUKtx45R1I+Ldw/ZbfLExm4bz5Dmr4t4pt9QpGiz1HihcKQG7uGPo/aMweTjwD2BP9ISI4QPjzbmpVH+XmgPc3kEjuIAbUyfIdrcGaXSHK7hNc+hlc4w3l98J7gGTVggFNJRMY+y6rx0PHr6eUXEfK7K0KeHq1z4Y3xRnH41dOXXCbKIEIlVa/0vrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSc/lPktkhxDrFG2mflrOGfs6EzDWqux23ecOKi4Qu8=;
 b=GrIv9FwWjoS9h7bra8Ne6tVDxT/PaEmkehoJo6TQGKFmLUI7mAw/g3MXkkbQotI5iW7Z6O+7G485ze9UQJy36dKnqDQ7VmI7MSWzmb9cmNQi8tKpH4iV3sq6qgTsewjZD7fDTjPIYZaAtOqSuJTitQHJNhaIJQFsAKetLN1+ijemxRdx/hI2WCcFVQDfqmYBWxUtI2piXM397oJPd83mq9UNSbop2Axaid4LMZDKENBj42EdopzWeOvUVzrh/jzHUP0eH9LSYb/+gylvu9WSCF8fJbGzo2q/8OkctEG0cZyGOUVi/nlHGn0dX+x634Ya2t2Vivy034dH2gc3P3F6Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSc/lPktkhxDrFG2mflrOGfs6EzDWqux23ecOKi4Qu8=;
 b=vbDhe5OshZ6IGzjYSIxIRyukBtec36NT7YuY5a1UqoOy6dgnOK8S4PK7j4Pb4ffAVTtldcAJlI0sFXDUCE9PXQy1fXS/qlUraCwd5cFxDiVkf0J/HG05rq+xd4uDG6YdTD8vrwgafiFpC75yxYW9DbOW0mEXvz+AWpoUBGXBbW4=
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 12:56:59 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::555a:2980:a5c2:8d29]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::555a:2980:a5c2:8d29%8]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 12:56:59 +0000
From: "Das, Nirmoy" <Nirmoy.Das@amd.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, Greg KH
 <gregkh@linuxfoundation.org>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Fw: [Intel-gfx] [PATCH 1/5] dri: cleanup debugfs error handling
Thread-Topic: [Intel-gfx] [PATCH 1/5] dri: cleanup debugfs error handling
Thread-Index: AQHXvCVOX+r98BpL20ibYh87C1bzDKvI2NmAgAAYK4CAADUDgP//6OS1
Date: Fri, 8 Oct 2021 12:56:59 +0000
Message-ID: <DM4PR12MB51368C12F6338C6F245D54B28BB29@DM4PR12MB5136.namprd12.prod.outlook.com>
References: <20211008091704.27094-1-nirmoy.das@amd.com>
 <87a6jjyhuo.fsf@intel.com> <YWAmZdRwnAt6wh9B@kroah.com>
 <02fc9da3-ebac-2df1-3a54-d764b273f91b@amd.com>
In-Reply-To: <02fc9da3-ebac-2df1-3a54-d764b273f91b@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-10-08T12:56:59.062Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
suggested_attachment_session_id: 7d9d88f6-e7a3-83fa-9b5c-02044ff22830
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0296679-317c-468a-3883-08d98a5b1dc4
x-ms-traffictypediagnostic: DM4PR12MB5165:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB5165D94A0490B29D739F66568BB29@DM4PR12MB5165.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P1aG4opSXPGQY9L8Y/H6duLa+OnJLd24BO8brGgaDJuEGkY6aS4vACClIVHyu8bY1APZo36phWaqezgKF+5ohxyHUjAc5HutEgH7FrKAKLCwBmyzxXB/fgE9XwuXRdZI5lz3oP4bDY9FxBQgHCpCwMu5Uygw3fSBL/Z/aG6L+7ziavlxeKTG8SJevoVjPBjlsP6bwGISu9mDbNXF8L+gmPbMFYP/GsS5uFO7zbNHIVp9tsU6EHuc3HXLf73r5y2ONOoCiwh90V3IF5zBsGlGobqPwVeHjTTPJ2rjNeHNo3LLpPau2hgIkqJfeA8sbixNZOYDlzLydfeunOtpswaCPGE9TP1HhoZWbYHlKagkC+uv6xnZxoF5iRcgTJq5RIYBN53S9VkwyzVZ8LOnMIP4WZmXxaFSIC62a89V4U6FTHUBF56mnXNh/EmYa/YHyRguzSXJkERPqOpgFZBJLdxPMPq+CRxOLbaDIbqkcWQIbdVzBfhW1Zs2lQRqw3A4fs4eUDrs8dY452epEChfXUrjIE00+vlCykEEhVVZ+QeT82/OHCvR2sQhid+lqE5G1+d9FsY2Hs1WjoVei+xbOstjRf9KZ2INJuPEEmrvmdYokOkwmooQgo4mDmTWV/n0cYjtNe48xRImhWBN+a8GM8Sl/8Ds8hsdcJqXI6Dm7IxZWM657hFCTzocHh+q1WIx51DITypD/OI9Z1ZKIFyRVu8vog==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(8936002)(38100700002)(66446008)(64756008)(66556008)(122000001)(9686003)(55016002)(8676002)(508600001)(5660300002)(4326008)(52536014)(86362001)(6916009)(26005)(186003)(7696005)(2906002)(53546011)(38070700005)(6506007)(71200400001)(91956017)(19627405001)(76116006)(33656002)(54906003)(316002)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?JjesSgOhAPgmiXFmbcIJP4fowEvwiPuzcfs26NLT4ZqtsLGulDLOr/qrZb?=
 =?iso-8859-1?Q?bIBGIiogXol9OtoV5QQ4I2ZarHz91jen2h5ze+qy4W+GW3W2rA/fsRqMmo?=
 =?iso-8859-1?Q?XCjzV68DLjGo8Kkbp1xzEEK9TNB6/GwU+V6ZFuiV9b+OmXJYSje2SxLY0J?=
 =?iso-8859-1?Q?rTNJHXICpWmFehlx3ZACRmBIa5xXOT9xVFSVrP5KHiNdGUIrnVaCjxKpuv?=
 =?iso-8859-1?Q?F9D65bhZbXfc5bKwyD1U9tj9jbLuEsbL2cCcS9/B7k/mDfPEwFHqfbWYG8?=
 =?iso-8859-1?Q?Gw21z5UgEw+AcYk/BaVpucwRHH8FVFzAHJ4/KAF+zkvwbhd0ymjhni4ZsU?=
 =?iso-8859-1?Q?K3BgSZvm+qQ6MIncewAyTLrkWZ5yjZjIWLx6/JHmlftuE1Wc3hq4YzJr5m?=
 =?iso-8859-1?Q?rmO7/yfrDP/WfxaO7s5I888pmOlnBmGU7ZeBUd/22KQ2skac5lKBfz4e0g?=
 =?iso-8859-1?Q?JKmV3vlL9vErOgCJ3YaldQag3ozPxJbPUb0inb/Jod+VA1v8oR8BagACtY?=
 =?iso-8859-1?Q?Z0asjPihehuHk2qyG6hJJfrcjt+XfjtITc2X88zxWv6INXPcjYwarqsdyr?=
 =?iso-8859-1?Q?MmnhHPISHikIWXu4IT5PqgShgyGIdePQPprWThMjenSXyJW2K8JO+yUxbv?=
 =?iso-8859-1?Q?brQsxefFdtwv6CG7r5QxRgLBVmzvhGqBnwzaBFwzBhAy8T4lY7mPTOCboC?=
 =?iso-8859-1?Q?7KlPSMZk4KwO6AIZZ2XR6DKbIf0+5+dG59rdl80Qo5VwCZzkeunxRoknH0?=
 =?iso-8859-1?Q?+0wyhtoat1DK3QM/tRL33sTX4aE/GWQn1uG6/7BFbdJMOwlwUBc/I3Mf/7?=
 =?iso-8859-1?Q?bEEZab2QMcgTJNCrZN1NKWGkWV7nMRkuq1YITn3SSQD9MtU638+0tgwZBg?=
 =?iso-8859-1?Q?j2jIWV6vusfeW01B2hT0sjFgzr4gm5iGpdbavp/JQyHl5pOS+Fc8MOqACM?=
 =?iso-8859-1?Q?v6tPpZUw+DX1/qu7UJEhXVzg3UF7Q8aJ0505BgjBG5hHPj+egA4DQqqTqI?=
 =?iso-8859-1?Q?x6fqdweVOAwLPXVjA1ltlvWaO/TKbI9I49Osa/c3QFZDej7zkv1g51jLgV?=
 =?iso-8859-1?Q?Ge0JQiDVAdRfH4jP20jDB/q868cHY/ZsdtHsX4TxRFiDeQLvKnbetLodQ/?=
 =?iso-8859-1?Q?oFLprBQelSYCuUreJDbE+WWrX/NppWE30NgutJwis7QtSQYMCcvGtMIv7f?=
 =?iso-8859-1?Q?XFvEIivuFkDdrZraxvrGiLFafo3wEpRy7YO3F8OJQW46iSpSQNFlQzpobK?=
 =?iso-8859-1?Q?LX08nKjrSgxKTUJSwQDB3Ktm4b2NUYfD0zSB7r0gZNqLGRI7wka+BbGGxq?=
 =?iso-8859-1?Q?d5106cRVc/l5NREvsw8p5HGZ095EL3RU4LUSBx++qZ2bGhg=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DM4PR12MB51368C12F6338C6F245D54B28BB29DM4PR12MB5136namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0296679-317c-468a-3883-08d98a5b1dc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2021 12:56:59.4486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W6w59HXHeUx9sOb0AmpOer11pcsv3RI0AnnNIkRwcYE7OJQR+FbTfTNPWBp5wbx1XscOJVIcO7jaNuANt3ZZTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5165
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

--_000_DM4PR12MB51368C12F6338C6F245D54B28BB29DM4PR12MB5136namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Trying with Christian's Gmail, as he still didn't receive previous emails.

________________________________
From: Das, Nirmoy <nirmoy.das@amd.com>
Sent: Friday, October 8, 2021 2:17 PM
To: Koenig, Christian <Christian.Koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; inte=
l-gfx@lists.freedesktop.org <intel-gfx@lists.freedesktop.org>; Maarten Lank=
horst <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.or=
g>; Thomas Zimmermann <tzimmermann@suse.de>; David Airlie <airlied@linux.ie=
>; Daniel Vetter <daniel@ffwll.ch>; Greg KH <gregkh@linuxfoundation.org>; J=
ani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/5] dri: cleanup debugfs error handling

Adding Christian as he didn't receive the full thread yet.


On 10/8/2021 1:07 PM, Greg KH wrote:
> On Fri, Oct 08, 2021 at 12:40:47PM +0300, Jani Nikula wrote:
>> On Fri, 08 Oct 2021, Nirmoy Das <nirmoy.das@amd.com> wrote:
>>> Debugfs API returns encoded error instead of NULL.
>>> This patch cleanups drm debugfs error handling to
>>> properly set dri and its minor's root dentry to NULL.
>>>
>>> Also do not error out if dri/minor debugfs directory
>>> creation fails as a debugfs error is not a fatal error.
>> Cc: Greg
>>
>> I thought this is the opposite of what Greg's been telling everyone to
>> do with debugfs.
> Yes, that is not good.
>
> You should never care about the result of a debugfs_create* call.  Just
> take the result, and if it is a directory, save it off to use it for
> creating a file, no need to check anything.
>
> And then throw it away, later, when you want to remove the directory,
> look it up with a call to debugfs_lookup() and pass that to
> debugfs_remove() (which does so recursively).
>
> There should never be a need to save, or check, the result of any
> debugfs call.  If so, odds are it is being used incorrectly.
>
> thanks,
>
> greg k-h

--_000_DM4PR12MB51368C12F6338C6F245D54B28BB29DM4PR12MB5136namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
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
Trying with Christian's Gmail, as he still didn't receive previous emails.<=
/div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size: 11pt;"><b>From:</b> Das, Nirmoy &lt;nir=
moy.das@amd.com&gt;<br>
<b>Sent:</b> Friday, October 8, 2021 2:17 PM<br>
<b>To:</b> Koenig, Christian &lt;Christian.Koenig@amd.com&gt;<br>
<b>Cc:</b> dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.=
org&gt;; intel-gfx@lists.freedesktop.org &lt;intel-gfx@lists.freedesktop.or=
g&gt;; Maarten Lankhorst &lt;maarten.lankhorst@linux.intel.com&gt;; Maxime =
Ripard &lt;mripard@kernel.org&gt;; Thomas Zimmermann &lt;tzimmermann@suse.d=
e&gt;;
 David Airlie &lt;airlied@linux.ie&gt;; Daniel Vetter &lt;daniel@ffwll.ch&g=
t;; Greg KH &lt;gregkh@linuxfoundation.org&gt;; Jani Nikula &lt;jani.nikula=
@linux.intel.com&gt;<br>
<b>Subject:</b> Re: [Intel-gfx] [PATCH 1/5] dri: cleanup debugfs error hand=
ling</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Adding Christian as he didn't receive the full thr=
ead yet.<br>
<br>
<br>
On 10/8/2021 1:07 PM, Greg KH wrote:<br>
&gt; On Fri, Oct 08, 2021 at 12:40:47PM +0300, Jani Nikula wrote:<br>
&gt;&gt; On Fri, 08 Oct 2021, Nirmoy Das &lt;nirmoy.das@amd.com&gt; wrote:<=
br>
&gt;&gt;&gt; Debugfs API returns encoded error instead of NULL.<br>
&gt;&gt;&gt; This patch cleanups drm debugfs error handling to<br>
&gt;&gt;&gt; properly set dri and its minor's root dentry to NULL.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Also do not error out if dri/minor debugfs directory<br>
&gt;&gt;&gt; creation fails as a debugfs error is not a fatal error.<br>
&gt;&gt; Cc: Greg<br>
&gt;&gt;<br>
&gt;&gt; I thought this is the opposite of what Greg's been telling everyon=
e to<br>
&gt;&gt; do with debugfs.<br>
&gt; Yes, that is not good.<br>
&gt;<br>
&gt; You should never care about the result of a debugfs_create* call.&nbsp=
; Just<br>
&gt; take the result, and if it is a directory, save it off to use it for<b=
r>
&gt; creating a file, no need to check anything.<br>
&gt;<br>
&gt; And then throw it away, later, when you want to remove the directory,<=
br>
&gt; look it up with a call to debugfs_lookup() and pass that to<br>
&gt; debugfs_remove() (which does so recursively).<br>
&gt;<br>
&gt; There should never be a need to save, or check, the result of any<br>
&gt; debugfs call.&nbsp; If so, odds are it is being used incorrectly.<br>
&gt;<br>
&gt; thanks,<br>
&gt;<br>
&gt; greg k-h<br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_DM4PR12MB51368C12F6338C6F245D54B28BB29DM4PR12MB5136namp_--
