Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEB73FD0AA
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 03:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE106E106;
	Wed,  1 Sep 2021 01:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2050.outbound.protection.outlook.com [40.107.95.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8F46E106;
 Wed,  1 Sep 2021 01:23:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HkeXTMJYVKApz0nMyXdmN+4AetOvtnlQVhj5YOAEH2DTuuqiH+jGbn77vlFyU9PsjGQsqBZs4gHlUVhrO3t1zX/TvVTCTO17SSVQ7QweBvBbNMoWHsVQYSkWKEfAF5q0D5+0u18eBTvnSo0026tIWvrWGxwse+jL9wVnzcBgF3P6I0HZ4Xd/HiumG8BrFYQWqY3vqrhQfZJK0d7gqecFFlejvFKa5dGJJYArYxG2zVDnNsyrDzpLnh0AlIQa+AiFNdKqLp1abmrRXYZvUdbMDGIwlh9gX3Ld5uEWgObqh8x3mw9qTJWHXQY12bIleEvfb+usTCKIIivPd31jOzeV+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4K4nRPEEk1EnZLhvwSlL5csxaUwzpdYN+wRpdW3PNaI=;
 b=hvbCy3cdRe8e0m2iIi6hw8MHXR9FNmhv2ShTWikMmzX+ZsGkePGJwKcx5d0L7JcEnhNjuccZu2QXKS3sXV64nVvsUPLsZNRDEM8QXGpMid7cKDA/w+qhxo2ptJAjbjfvoEPS3I4ZOApKau6BDG1eYUJX5R+R9gwzLvyOfNMsHs0EPk3TYbU7r65dIK/n8Lw4A9bpimyf/BOsY16x+/5dpPHMQ/Wa3XrvfF7biJKK51oO/3sdfdwPQW5jwaMAknPZ0SvqOwHhVJDEuJlQDrWyeeNiPHSlzN/W1L5WVAI1phg/BeNEAFGFQo4NUacXwidLIxPllRNwQQm3ho8dpUEwcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4K4nRPEEk1EnZLhvwSlL5csxaUwzpdYN+wRpdW3PNaI=;
 b=V1V6dH8GtPBBVF4ksGLud62UKydzOGtq9hO6XSNSyJ1HpxrdWvc0nVSw5/wgiAFCEFJ7sbR4QepxgS3PUZ8nRz3IucpSW/mf+mS44ESGzLfV/rVwhfw4inU+od6aQhuhoLsY6vBIrnYQPdv+MGsspVQuyt1mDx2UeVEwdm+xd5w=
Received: from BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20)
 by BL1PR12MB5031.namprd12.prod.outlook.com (2603:10b6:208:31a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 01:23:17 +0000
Received: from BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a]) by BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a%5]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 01:23:17 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>, Daniel Vetter <daniel@ffwll.ch>, "Chen, JingWen"
 <JingWen.Chen2@amd.com>
CC: DRI Development <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [diagnostic TDR mode patches] unify our solution opinions/suggestions
 in one thread
Thread-Topic: [diagnostic TDR mode patches] unify our solution
 opinions/suggestions in one thread
Thread-Index: Adeezw8WIoeNdpdaSO6/zguUPH+5Cg==
Date: Wed, 1 Sep 2021 01:23:17 +0000
Message-ID: <BL1PR12MB526942160701B46D4B28EEEC84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-09-01T01:23:14Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=c5d17fbe-6cdb-4bfd-861f-b770323aae9c;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05a654e8-b6bb-45da-7039-08d96ce713db
x-ms-traffictypediagnostic: BL1PR12MB5031:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL1PR12MB50316B83BC5AC362A5F0844B84CD9@BL1PR12MB5031.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +419xxN9VcsL/iXfhzbzsc6f+x8Mk3XTF1xi2NhmHb4dCYMsGOo6zy3xtAwCyuCCyrBBQj6OVJalpVkEqp49ApWNL3UxGJJiRNjYgVmLHlzVerOqG1xF0l9QPoaJtcQrmJAiqwpY0FL5bnIJ1+C4ZQyGV9VW9Y+qRdyMxJtOSwttqLJvqL4oF1WT/iwRkGfsbBYQF7cXXNz7B0PdBKenwKofozHLUTYFKflnxim+ePtQ7w9fY1WOLKZz7r+ejhXiosHTsKZFu40uW8K17unj6uVLSlca8ZJdY0HwuvOP9pSHjD2gy6/hwny5uVEurmgZKlxyVs5x9gAoJJ0S+pWy1DLFhbyPdSJQ5vBbJmB6cTpkzSv15TElmFz04fMJFL4OxY7ytVYVXFNBPi+ISfZ1uOADUZXUOpnvmlVHslU+XkMYOTVUH2j70uT0YMM9iKuEQQKDAb/OCZpCgBjjQtXxdd/mDkb9uhQ90reFsX/4yqAOVin6N6RzmBEfEpKvLyp3hbROsyNohl5QMCputKd9o+SIVffDQW6nWuSvZWj//22VktoeS04JPqkRSWX4AzLM7/yxxjraxPMrOKWXxPSu4rXJBq/dWvPXJCNKJVZxMeLtaJJ6ZQDwlV3AGdCVhq2YVhKmwQPFeaLl/dqhiJ18pZTn/h5b9zBTvI5RzyXI5RPM76vmgL1rYkxNAQwzFnOT1rneOBdSTu2DJMQYlMRxSw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5269.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(478600001)(55016002)(6636002)(76116006)(110136005)(7696005)(9686003)(66946007)(122000001)(186003)(26005)(66446008)(38070700005)(86362001)(8676002)(316002)(66556008)(52536014)(4326008)(64756008)(6506007)(71200400001)(66476007)(8936002)(2906002)(54906003)(5660300002)(38100700002)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Obva8Mm9i+M6YQJuB60/lhyYn8a2RtYbtmDls/HwZlOOdUDG9hKtckfTm+4G?=
 =?us-ascii?Q?jDEz1vbvSzjQjmwDCrrKaX7NFUFEX9qepoJXOxQcLIc7sTWN39PYJw8FBrPW?=
 =?us-ascii?Q?EvoRG8sDDeZGVLitbBh/x0I5Ujfna630SkJRWAtpZoOQJBU0/cZrD/LsozVy?=
 =?us-ascii?Q?BE2NOvm5oCjjQhvWsNfudxJ2tsKQNfnKo0x/VUD5wPzlod0pa7BzTubSvWWk?=
 =?us-ascii?Q?cco9G+Jzh7WG/GFiQ/6n4AJaM5wlyW+k4tclZmQoUQrVDypiqyHU6JkM15iw?=
 =?us-ascii?Q?b6KwVwSzV/4hbhYh6jssDG/FetOet/oGLJTSWeBN98yp7Bk3ILiAHyh/Wxt7?=
 =?us-ascii?Q?ZoRkHzGNORPmAPSi4g1u1T7TpVk/jlOEpo87aFTBJHu2nE3JpYbNL8QZhHCI?=
 =?us-ascii?Q?t4VRhjKdufa3FW8wUTr4d2QvUNRqwNFAAu7GoA3VijryOkVxrK6jWhGWVCpC?=
 =?us-ascii?Q?aBUU5gskwcaH0eyQDd/HE89EXvSKzCJ0v17IYGgVQe1488LkVx6m6UQ46S2j?=
 =?us-ascii?Q?jX6u0fFl1KDoU0aBTI1iOs7Xm+Jw8I6GLSJkO5ePvWsR6QNf2ojXtAQCoBsK?=
 =?us-ascii?Q?+aINBv/Y8moE0Y19RGDsj5A4T3QfdHlVJhz6M14wlsqsmBdprL9G5ew8MVQv?=
 =?us-ascii?Q?EYsTwFBzlrVznjZbmCIXHLeG/b6eYsrkyAq1RyWZQd5swPDAJ5PXwTEFusQq?=
 =?us-ascii?Q?nWQC0rBQHQ/hICRqj74alLm6Us2vpsoUeKd1viMjuP4bvZ4YDi+TuVAyoc6d?=
 =?us-ascii?Q?hP/HbHNOkRJKROOglFZz0hrc8yeGJd866MdM1DQCF9uQd83wZpiSLPhRs2lJ?=
 =?us-ascii?Q?ccQa8KCyiu8MWu23Q4pOvWUWG42H3DTcfOMY4qYrFJspw5/5y6G85GLxTxk4?=
 =?us-ascii?Q?5zahqXh5N8sodv0IVprD48rGOoZFUH/OZ2Wxe1CdcCQLvvrV4Vko3K0DIHaL?=
 =?us-ascii?Q?tBovgoOtdgP4x7C3qQ4MOX29G5ljM181iA2aYEuKbzl/iodeQ3TxDVa9c1Gm?=
 =?us-ascii?Q?2yIdoohydcjI+ih7F9q02cw4CQIwnq3rBfHxtd/JBZe7CZBP1LRpbdT7QQpX?=
 =?us-ascii?Q?FvUBYOSNSy8+F0alSUSMT9DJvslJUqQlYhIDRMac4CHnrPnJO4L0j6GNaQW1?=
 =?us-ascii?Q?wIEvW26hJ2sdd9WXHNcritIw3IJok5nByG2jJe9Kh7uYqD+L64qnUzfu14Sp?=
 =?us-ascii?Q?yzmzIdw1GcDxx+CYw7EDzClqdJ6B8jd9HsNcQ5hkjcll0AKzIi9Ci8EC+Xr1?=
 =?us-ascii?Q?wcL4LJiW8NulanzV374UftyjZqMZ93gzAzTWmNPNeMfA7QkMBSSdJ4AdyhFR?=
 =?us-ascii?Q?ypTAVoM/QUPXC36+7dOZVbwG?=
Content-Type: multipart/alternative;
 boundary="_000_BL1PR12MB526942160701B46D4B28EEEC84CD9BL1PR12MB5269namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5269.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a654e8-b6bb-45da-7039-08d96ce713db
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 01:23:17.5073 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CGhDPVR0s/Jaj+GqPmtenXY3PiK1jdJBfTsc+PQSzol4OnZ2K+nTHUWwtwvbRrMG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5031
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

--_000_BL1PR12MB526942160701B46D4B28EEEC84CD9BL1PR12MB5269namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Hi Daniel/Christian/Andrey

It looks the voice from you three are spread over those email floods to me,=
 the feature we are working on (diagnostic TDR scheme) is pending there for=
 more than 6 month (we started it from feb 2021).

Honestly speaking the email ways that we are using now is not friendly and =
quite painful to me ....
Can we try to put all our opinions, suggestions, or even objects here toget=
her, let's go through them one by one, it's too hard for us to reply each e=
mail on different questions .

For [PATCH 1/2] drm/sched: fix the bug of time out calculation(v4)

This is a fixing patch on the timeout timer in scheduler, can we complete t=
his one first ? it should already resolved all the questions and suggestion=
s.

For [PATCH 2/2] drm/sched: serialize job_timeout and scheduler

I think I already explained the questions raised by Daniel in other thread =
, regarding why I use __kthread_should_park()
For other aspects, can we put all our opinion synthesized here ?

Thanks !

------------------------------------------
Monk Liu | Cloud-GPU Core team
------------------------------------------


--_000_BL1PR12MB526942160701B46D4B28EEEC84CD9BL1PR12MB5269namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
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
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<p class=3D"msipheadera4477989" align=3D"Left" style=3D"margin:0"><span sty=
le=3D"font-size:10.0pt;font-family:Arial;color:#0000FF">[AMD Official Use O=
nly]</span></p>
<br>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Daniel/Christian/Andrey<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">It looks the voice from you three are spread over th=
ose email floods to me, the feature we are working on (diagnostic TDR schem=
e) is pending there for more than 6 month (we started it from feb 2021).<o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Honestly speaking the email ways that we are using n=
ow is not friendly and quite painful to me &#8230;.<o:p></o:p></p>
<p class=3D"MsoNormal">Can we try to put all our opinions, suggestions, or =
even objects here together, let&#8217;s go through them one by one, it&#821=
7;s too hard for us to reply each email on different questions .<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">For [PATCH 1/2] drm/sched: fix the bug of time out c=
alculation(v4)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This is a fixing patch on the timeout timer in sched=
uler, can we complete this one first ? it should already resolved all the q=
uestions and suggestions.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">For [PATCH 2/2] drm/sched: serialize job_timeout and=
 scheduler<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I think I already explained the questions raised by =
Daniel in other thread , regarding why I use __kthread_should_park()<o:p></=
o:p></p>
<p class=3D"MsoNormal">For other aspects, can we put all our opinion synthe=
sized here ?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks !<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">------------------------------------------<o:p></o:p=
></p>
<p class=3D"MsoNormal">Monk Liu | Cloud-GPU Core team<o:p></o:p></p>
<p class=3D"MsoNormal">------------------------------------------<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BL1PR12MB526942160701B46D4B28EEEC84CD9BL1PR12MB5269namp_--
