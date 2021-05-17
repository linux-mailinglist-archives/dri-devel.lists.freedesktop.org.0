Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B705383BD4
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 20:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CC66EA28;
	Mon, 17 May 2021 18:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8129F6EA28;
 Mon, 17 May 2021 18:02:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mACy29xnTim1Vi46Koz2Q6usyIb72zdMUlVA2J+PGjb/XEmtZWJu9o7lXiTzCzk0HeGlybN+8+L1LJQqO7HFUWHdk1KlrYTu3MCDEodJ8NQG+L38mRmEIkcW+MLnFKDKxnOH3a0div1HAnFPTVM0kWNkno0MwTNXrvwx7SHln0dKzSTlmIZP+wk7WPfSLuLK5b7QPX71HOMruXlxobYkOZtjLZ9bQrQYNvutHbXd5nPk7rR1yuuVYNPOxXydmX5ad3L/Gm40646KHLK78C/5CMHoO9597Qgz0GL2lUPG+q/yVQtdNcq0kIjRd+2KxhByALgsi8zkS9gHo9aCPZCX1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9fyHOPbQqZztfew0i4zv/fAXlVa0IOVOhJQrrNKoRE=;
 b=TkWOm4M8HV/yoA4iZf6pYn1990Xo+4OuEk8nv97C5MutiytZYJZ/ZpaY6XqIwlSiuk0wYc4sqVX/W4GtqiUW1gOQKg+rSVOtdcUlcM2dBclu+y4AUoOeO5500+ZlDZmLTzMB+t3TLsL/AuIT0Zp/joKUFrglKwFT4KvSb+KzTKHja5VPuAsKCjVgNANAVm8QKbE1cGSL5guAnXKCHeYLHhIok5a72wD7qd1jstXaf2/lkjOXTIwGDGqdspR9Y8czSIZFHFCSK75wJWiLvPKRQJECAyvAFH7vm9I1B16oxJmdigdseKFpATnYImJxPWmofaIMfX9U2rvh13cB8qTItw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9fyHOPbQqZztfew0i4zv/fAXlVa0IOVOhJQrrNKoRE=;
 b=LJgdZFUHGG6KEQPeS8eATJPJoulTmHmE526jnsUyGOTKI42VFJ93LDDtuT/NKMXx6wfNmoEQH7HuQCDuMUicsLSrRWmk1FAuqG/1dHQvHJFNivhYNv9Hg9tfZaBItCSZPJaiQWy9NG/n+MA/ZM42JGBOweHDV8YNqiLKsxfYur4=
Received: from BYAPR12MB2840.namprd12.prod.outlook.com (2603:10b6:a03:62::32)
 by BYAPR12MB4696.namprd12.prod.outlook.com (2603:10b6:a03:9d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 18:02:27 +0000
Received: from BYAPR12MB2840.namprd12.prod.outlook.com
 ([fe80::7c65:7181:6d1d:8616]) by BYAPR12MB2840.namprd12.prod.outlook.com
 ([fe80::7c65:7181:6d1d:8616%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 18:02:27 +0000
From: "Nieto, David M" <David.Nieto@amd.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Daniel Vetter
 <daniel@ffwll.ch>, "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 0/7] Per client engine busyness
Thread-Topic: [PATCH 0/7] Per client engine busyness
Thread-Index: AQHXSIY0lKCbwi4zp0q1CiNO36lst6rikGdbgAAOK4CAAF5BAIAAA0mAgAAPFoCAAAKJgIAAAbMAgAACEoCABKvngIAAAHIqgAAYpACAACA2lw==
Date: Mon, 17 May 2021 18:02:27 +0000
Message-ID: <BYAPR12MB28409E25DEFD3DD620E596ABF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
References: <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
 <CADnq5_N03pz6GmptzhRnCRQH=qkd4eWuAbuUysHp-A9NZHQMHg@mail.gmail.com>
 <BYAPR12MB2840AA68BCAEBD9279C6184FF4509@BYAPR12MB2840.namprd12.prod.outlook.com>
 <39ccc2ef-05d1-d9f0-0639-ea86bef58b80@amd.com>
 <7d6d09fe-ec85-6aaf-9834-37a49ec7d6c5@linux.intel.com>
 <9144f63b-953d-2019-742d-6553e09f5b40@amd.com>
 <22e7d6ea-f2dd-26da-f264-b17aad25af95@linux.intel.com>
 <b2203d34-2de3-7c58-de2f-bf6fafc3f67c@amd.com>
 <6cf2f14a-6a16-5ea3-d307-004faad4cc79@linux.intel.com>
 <a2b03603-eb3e-7bef-a799-c15cfb1a8e0b@amd.com>
 <YKJ+F4KqEiQQYkRz@phenom.ffwll.local>
 <BYAPR12MB2840C633CF05C1F29263F5BCF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>,
 <c85fc53f-d25b-464c-d411-eed4a509a009@linux.intel.com>
In-Reply-To: <c85fc53f-d25b-464c-d411-eed4a509a009@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-05-17T18:02:26.563Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD-Official
 Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [71.143.192.69]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d50f03f9-6eb5-4879-e3a5-08d9195dee67
x-ms-traffictypediagnostic: BYAPR12MB4696:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB46965B47B7E644412E80F37CF42D9@BYAPR12MB4696.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bkqArOQ9pL7Z2yDOfsulkuuiXdD8HLFiU6Xd1hY7tRfcfqp9SWB3dx4xcCKsZl0HE+u39I/8nAKb6I9y9Wp/R5KUH3Lei/9Sc3kju5RPgyQc6DDOzvgOURbrQzIIj7P4DRWA7AHess+xF6nkO5LmK3PJ00XmNSDfBC7q2VVRPc71AoDMDUWMzDnsad4Fi6p31XDTNho1qEWHh9zRlpp2tYab1gKXYaJrVyy2fkcJVUOTdA+gJJHAoaATAUaSdZLDZ39jA+w3l8pj36phRmRZzwLPvehp8dhTsODCGjRqdDVoVtWdYu9SasIb4FEF1h5+COt9n3NVow/Ev3qV+UV8GHTFBXRv/vJ71OpMJN2hFC77IVylSM1BnBTKMT5P9g/qYlCv21zp22PvgtsiD6rHfebV2U2y4V3cUmvX5g6T1sVt58f6H6mQuUtmBKHBdn0zDSrgMJPg7G16xyl5ChAoEc83NxuQhq1IQdEsVgt1tSWbUsS7fLEPdFRSzxBCQdNTWJyO8nFvtT4Q7/8mpk69ULbwb0rsgaaw51+VTcQ5ha7+D/TfBXnlGupOFcWUk7unnGE1ARTkQgKJTtqLIHhRIGrTNAlHq6Vo7tai/NyMQkFmk9uEemT8DFGcBJo5wckeYtQCCIDUL1ur1MIj5bMifAeDPKb8WxblTwUgVo9hHOAYHlPhJLKglqMlp9+wdaG1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2840.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(316002)(54906003)(110136005)(186003)(4326008)(86362001)(26005)(9686003)(66946007)(122000001)(76116006)(5660300002)(71200400001)(55016002)(53546011)(2906002)(6506007)(8936002)(7696005)(478600001)(19627405001)(66476007)(21615005)(66446008)(66556008)(64756008)(966005)(6636002)(38100700002)(166002)(52536014)(8676002)(33656002)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?XROr3CdLb7tpwZ0AYW87JmzlpgbEpwqxaH8aNFeadCsLPJjHILVaKUdK?=
 =?Windows-1252?Q?geqGPG3U7IKzoieCMhZwYGAOvXYE1xnDgJNfRhjZERHRSZHVV/5gL6jl?=
 =?Windows-1252?Q?C/GPiYs4taR7Id7JaPO8LtI1EMBd9OkHC1YiJQaAOIgCWAB7Ed/svAoZ?=
 =?Windows-1252?Q?f/ORqzA429jPMF9OAi8DzGWe70fgwhROkU2qvzQWlafQxbi0dx4/1Rzb?=
 =?Windows-1252?Q?PYVkMnrckurW8gWckoMPvGSniJK1T/aKqm+8ilNsc5gFkYR42X6pKRL/?=
 =?Windows-1252?Q?tgSJguNfl7ERwYlgNQooVCVwPfCNvla2MgfJIWEcROPg73O3g3EcF5JF?=
 =?Windows-1252?Q?ZY7n+UL0KaiU+jX8dp1QhqbGfzceJJRsDdg80zG2ksriKE3WilwqeXD2?=
 =?Windows-1252?Q?ZHI+xwKReEsNo/RXy1sIMtZHAgRtJrNvVgCrRHNH7O5D0Sdh58wPmSVA?=
 =?Windows-1252?Q?5xjGYvXyXDIc6DjBtnvrELnW0OVcxu8QHmmnYZZfBQ2GbXBPnUyfQSWy?=
 =?Windows-1252?Q?TNNc9Onjd5BhUSVqb/6WxbTaDUu/TTVL3fjnga56WOU0NBkRa/B3gRNL?=
 =?Windows-1252?Q?LC/12PRsVlj1uasburqfO7IE0lRxw+rvVkBkr7nd+YKGJWbm9xWUvOEc?=
 =?Windows-1252?Q?DpUxvFrtkoQsKGy2Ri/Su8KFuiOm+JVcE6c71qrLc29vfSixttf8WYSd?=
 =?Windows-1252?Q?F7tzfvUn3F6+2LLsaL30owSXL87nqjSzKmurR4OVwi9Y/p2nCGorvJdu?=
 =?Windows-1252?Q?sRTbofhSvA3PpOyT/npQQO5E8J3V/azpDiySvw4R1Ka8TFDqVNG3KknH?=
 =?Windows-1252?Q?BvmUPf4oPe3mp33bxesrgBSE0Ms5ToFuaF5f/vm29f4giNB0BnXg4dlK?=
 =?Windows-1252?Q?sdKp6bha/TeQ8rTr20le3J55PwJumA/7RBQJ3BAtlaRa9j6+yUpUEHIW?=
 =?Windows-1252?Q?165kUjDXOi3yiGpDTfoIAWY8tLAnHZ/O78ndit8dyC7BAJ+78J6e1InF?=
 =?Windows-1252?Q?dujMQ3HXtiTBvfmKGjMBXQ4mMDBt2beWRo1N1F9xGVM6ELYuolBpyxbe?=
 =?Windows-1252?Q?pPMEKAfFgx5PkcbXxKLqO8pOn7A++X/qP6mVnlNv9JPOFi0A3fPegg1F?=
 =?Windows-1252?Q?KuySy0qAHZfv4BBjUGSeCNcdBFUHjhwyi4uKdwe+hsfgcD7JPd5hAIwb?=
 =?Windows-1252?Q?I59j5cBqO9Z/X4NTu3amPxlxACKXFNwPTi+AFOR894E+mtCcWliVt4qv?=
 =?Windows-1252?Q?0jo1fOKR6MLixQrrNJLm04DJiBNoD334XZ7Zg0w8DFejeZ+9wGba9ndg?=
 =?Windows-1252?Q?Lg0Vhr9FHdOurpj5pp6Iyf4u3QvACO5qredpTYob+TEQR09FZYWv7CvP?=
 =?Windows-1252?Q?O1y7qe7qrecCW1+R835hw/zBePgsdqwxm7A=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR12MB28409E25DEFD3DD620E596ABF42D9BYAPR12MB2840namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2840.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d50f03f9-6eb5-4879-e3a5-08d9195dee67
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2021 18:02:27.0475 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KXhndf1Lq8gixNUqJj7v56nOhG7AP7kW/HWslregEVo5rBdmKfmsYnJkS8/zsvdy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4696
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR12MB28409E25DEFD3DD620E596ABF42D9BYAPR12MB2840namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

The format is simple:

<ringname><index>: <XXX.XX> %

we also have entries for the memory mapped:
mem <ttm pool> : <size> KiB

On my submission https://lists.freedesktop.org/archives/amd-gfx/2021-May/06=
3149.html I added a python script to print out the info. It has a CPU usage=
 lower that top, for example.

To be absolutely honest, I agree that there is an overhead, but It might no=
t be as much as you fear.
________________________________
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Sent: Monday, May 17, 2021 9:00 AM
To: Nieto, David M <David.Nieto@amd.com>; Daniel Vetter <daniel@ffwll.ch>; =
Koenig, Christian <Christian.Koenig@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>; Intel Graphics Development <Intel=
-gfx@lists.freedesktop.org>; Maling list - DRI developers <dri-devel@lists.=
freedesktop.org>
Subject: Re: [PATCH 0/7] Per client engine busyness


On 17/05/2021 15:39, Nieto, David M wrote:
> [AMD Official Use Only]
>
>
> Maybe we could try to standardize how the different submission ring
>   usage gets exposed in the fdinfo? We went the simple way of just
> adding name and index, but if someone has a suggestion on how else we
> could format them so there is commonality across vendors we could just
> amend those.

Could you paste an example of your format?

Standardized fdinfo sounds good to me in principle. But I would also
like people to look at the procfs proposal from Chris,
  - link to which I have pasted elsewhere in the thread.

Only potential issue with fdinfo I see at the moment is a bit of an
extra cost in DRM client discovery (compared to my sysfs series and also
procfs RFC from Chris). It would require reading all processes (well
threads, then maybe aggregating threads into parent processes), all fd
symlinks, and doing a stat on them to figure out which ones are DRM devices=
.

Btw is DRM_MAJOR 226 consider uapi? I don't see it in uapi headers.

> I=92d really like to have the process managers tools display GPU usage
> regardless of what vendor is installed.

Definitely.

Regards,

Tvrtko

--_000_BYAPR12MB28409E25DEFD3DD620E596ABF42D9BYAPR12MB2840namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:15pt;" al=
ign=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
The format is simple:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt;"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt;">&lt;ringname&gt;&lt;index&gt;: &lt;XXX.XX&gt; %</span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
we also have entries for the memory mapped:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
mem &lt;ttm pool&gt; : &lt;size&gt; KiB</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
On my submission&nbsp;<a href=3D"https://lists.freedesktop.org/archives/amd=
-gfx/2021-May/063149.html" id=3D"LPlnk856153">https://lists.freedesktop.org=
/archives/amd-gfx/2021-May/063149.html</a>&nbsp;I added a python script to =
print out the info. It has a CPU usage lower that
 top, for example.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
To be absolutely honest, I agree that there is an overhead, but It might no=
t be as much as you fear.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Tvrtko Ursulin &lt;tv=
rtko.ursulin@linux.intel.com&gt;<br>
<b>Sent:</b> Monday, May 17, 2021 9:00 AM<br>
<b>To:</b> Nieto, David M &lt;David.Nieto@amd.com&gt;; Daniel Vetter &lt;da=
niel@ffwll.ch&gt;; Koenig, Christian &lt;Christian.Koenig@amd.com&gt;<br>
<b>Cc:</b> Alex Deucher &lt;alexdeucher@gmail.com&gt;; Intel Graphics Devel=
opment &lt;Intel-gfx@lists.freedesktop.org&gt;; Maling list - DRI developer=
s &lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH 0/7] Per client engine busyness</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
On 17/05/2021 15:39, Nieto, David M wrote:<br>
&gt; [AMD Official Use Only]<br>
&gt; <br>
&gt; <br>
&gt; Maybe we could try to standardize how the different submission ring <b=
r>
&gt;&nbsp; &nbsp;usage gets exposed in the fdinfo? We went the simple way o=
f just <br>
&gt; adding name and index, but if someone has a suggestion on how else we =
<br>
&gt; could format them so there is commonality across vendors we could just=
 <br>
&gt; amend those.<br>
<br>
Could you paste an example of your format?<br>
<br>
Standardized fdinfo sounds good to me in principle. But I would also <br>
like people to look at the procfs proposal from Chris,<br>
&nbsp; - link to which I have pasted elsewhere in the thread.<br>
<br>
Only potential issue with fdinfo I see at the moment is a bit of an <br>
extra cost in DRM client discovery (compared to my sysfs series and also <b=
r>
procfs RFC from Chris). It would require reading all processes (well <br>
threads, then maybe aggregating threads into parent processes), all fd <br>
symlinks, and doing a stat on them to figure out which ones are DRM devices=
.<br>
<br>
Btw is DRM_MAJOR 226 consider uapi? I don't see it in uapi headers.<br>
<br>
&gt; I=92d really like to have the process managers tools display GPU usage=
 <br>
&gt; regardless of what vendor is installed.<br>
<br>
Definitely.<br>
<br>
Regards,<br>
<br>
Tvrtko<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BYAPR12MB28409E25DEFD3DD620E596ABF42D9BYAPR12MB2840namp_--
