Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C13836F580
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 07:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEF66E484;
	Fri, 30 Apr 2021 05:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD0686E484;
 Fri, 30 Apr 2021 05:49:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O4fsYwOa3owoF/H1bGjCmo+LNn1IDrr8YpYXxr9Q8f1kXMIBRoEBH2ks1cMqu6XynY2pgA8K7VST/3hsjlyydbMBQXucAFOuaGNyrdKv060PBPwI5vyeFfTsMT5k/jPcVoMSmPxQ+lwy8gsuoFea3AfbcxRSQ9vksfamrm7l9GphrjmjvkV9ujAznK6QhfxDSAVVrrgFgEhKsZ9yGZUfJlJN52sFd/W2ghDttPfDcfSEgztTHXDhK8aetUQ6qefFGxGWHRs7zS43a6JX0DlIjHmF02PNVXYDqX2ozYE+MOosHH0xejmdkDo9DfInutje0v+geOresU3vsdH9HGQCkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKqk73GwN4Gh24v2f6M7+zbls5mdfq5lo8lmyoqCcvA=;
 b=fqJe013oPiSy4EnLefEX6R26EDAuhdGxu+tk+wmAfqXYJKolX8aLuc0CasFSXLUqldX70GN9xlWC+R4ueGmXx9qGto6SdvaPWR0bMVWhRMEPyKF4V55f1Ld4TgNwQd55h7/i5jLWD5DZaltrC4xvhC8Iidq9c4Mrr5JT3Qp1e9ii/pyx9j8H8MThQP9jR4A6LSN8aPm2E3JTVXj49SQjQwwqCRJKghZ0SBy9KoYSMjWKjKz2myvVCvlZzPSB180ET5eu5u/nHrI+sI6JDe5vQA2M8BVUStjrOMjYkupTXtvzGf2NVhe2XAUBVpYE9l9ock3R8L7s5RWZk66juYrqPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKqk73GwN4Gh24v2f6M7+zbls5mdfq5lo8lmyoqCcvA=;
 b=RshjdNAChRrz7ruRGi7B1uRLfdJqkRy+5hQFZHjQmsgZLno+oZ4OrTzUNH+UgmhJF3NDk94oq5TInBw5YJpOrb4YtZ08a0fiZQesyy4RJjCVqFBnZi+H3ktz7goMRKvPFDk1aX/LM4uGADdC8ph04QVGORLDh52guPmL4k5B1f0=
Received: from MN2PR12MB4549.namprd12.prod.outlook.com (2603:10b6:208:268::15)
 by MN2PR12MB3679.namprd12.prod.outlook.com (2603:10b6:208:159::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 30 Apr
 2021 05:49:29 +0000
Received: from MN2PR12MB4549.namprd12.prod.outlook.com
 ([fe80::b83b:b880:25cc:c1b9]) by MN2PR12MB4549.namprd12.prod.outlook.com
 ([fe80::b83b:b880:25cc:c1b9%8]) with mapi id 15.20.4087.035; Fri, 30 Apr 2021
 05:49:29 +0000
From: "Lazar, Lijo" <Lijo.Lazar@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>, "Wentland, Harry"
 <Harry.Wentland@amd.com>
Subject: Re: [PATCH v5 03/27] drm/amdgpu: Split amdgpu_device_fini into early
 and late
Thread-Topic: [PATCH v5 03/27] drm/amdgpu: Split amdgpu_device_fini into early
 and late
Thread-Index: AQHXPED31dtAN1Hzr0610aKd3EouaKrMhrjrgAAHMQCAAAEikQ==
Date: Fri, 30 Apr 2021 05:49:29 +0000
Message-ID: <MN2PR12MB4549AE4C448D5CDF3008707F975E9@MN2PR12MB4549.namprd12.prod.outlook.com>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-4-andrey.grodzovsky@amd.com>
 <MN2PR12MB4549896A55131D4A327908E4975E9@MN2PR12MB4549.namprd12.prod.outlook.com>,
 <9437bddc-b944-3f7b-deb5-6068cb12a48c@amd.com>
In-Reply-To: <9437bddc-b944-3f7b-deb5-6068cb12a48c@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-04-30T05:43:41.0872779Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [106.208.139.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 354ccf87-e8c4-4db3-b77f-08d90b9bb8b0
x-ms-traffictypediagnostic: MN2PR12MB3679:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3679A92630BB5E219E508176975E9@MN2PR12MB3679.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZHVCmo5TPl4HjDIM8melnB7mCSxAWvWYvyFsV+42JUQnHokRqZlgzpvTrIT30UdYOSvyIy+nTSDFq6xZ4+G8PQG2L/qcmKwFh9BQGeX3p0NR53HzPm7TZekhiMdYXeKrVEyiKcilTS7frex8zEBBl3Ivs+r08TXd+OEK2yRZWwcXMy25tWR6MK4Kky3Yfty9+zD2d65T0T1Qln3b3Y55pLR+IDHzyPcTNdZc8bkcsUlIbi6f2iOaXo9GCl0BbM5Y9JUuMG7dJm2t8VSYVeLM0dezZ7f2vls9vB0ekgtM8CfY+L5Z2aTU2Nh5VbzggLtmYO82p1k+Jgp7ne63ht3DQUbdh2lL8NPf08+B2RdBa4xVcc7jrnIcapmXl/ASl5J/GskQLGNqM8SPNXhEeUmrcyra/lKXRNmq34kLK9KIWmy5+OvHeiUT4aPP+ARYkB9zesOD26/JY8gBuBTTjMT5cNAsj0AIODGZW4HksRRRL0ZevSRkJJpfU8Zbqyrfod176hJAVWQwVrxMPvdUn1NiGUq9e7+jeCbLObj8hb/xDpKVLk9o4LcadxwsP4PCuXXXnH5yK73VZe/E+oibJxfEmpvFHB13pJeB2InjHxyuCEs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(366004)(376002)(136003)(4326008)(6636002)(33656002)(52536014)(26005)(478600001)(7696005)(66556008)(186003)(86362001)(66946007)(54906003)(66446008)(71200400001)(9686003)(5660300002)(6506007)(2906002)(122000001)(8936002)(110136005)(55016002)(66476007)(38100700002)(76116006)(8676002)(558084003)(316002)(64756008)(91956017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?BCz+ZngczkqXZDMjN31aaEpwmlMB1mpc5EcytbFa155mus/f/jzIRUTKUx7Z?=
 =?us-ascii?Q?nUPMWnQWEwwlCSKgTRDvyZXB8ZPWc+Fuu8YO++thorJBiTkYfcPWoqcTNbdG?=
 =?us-ascii?Q?BhOEEZU2UNVquKFBli4PmQjYEn8IAs05CVO0XjpjDdklcIpfFy/DkMHvWXdv?=
 =?us-ascii?Q?75jFQKC8Oi18XvFk6s38dXkQfoSXjcUWVms0RoqcwcPmcWAcw0WX0iw8bLdy?=
 =?us-ascii?Q?3m1hAbmp7gpTYr9GVeVYRYEFX1iBHa1QNYPEEPwYIDHWe9+WzWuUyVRnlYe6?=
 =?us-ascii?Q?VPH4u6DNWUBAmGLiHeXwKZsGClmYnQVSMHu46TRoaoac20bU10IjwMV1z/Os?=
 =?us-ascii?Q?gdWM2ONydMMXuu1WYYsc0MYlEUdGiAE0u8ti4JqXvBfO2QtFqFcdpMum/I7S?=
 =?us-ascii?Q?+g5rnuJtd8sYI+BYg06VvCUClgBrSqbgEsWnqX74wfeiit9BpELe8bjCXUD0?=
 =?us-ascii?Q?6m4mRCF33XuLiNAgSsuK5RNGIJi7LUZfybZMWoZ9eP3mTGFxM4OE0dJnvL04?=
 =?us-ascii?Q?zgZbE5QpTjLiEt3NGoAAV/DzaH/ElAPQwfJafENpHAHPhWA30zncyutPxAmC?=
 =?us-ascii?Q?4NeAn7e4L5cXVcOE0KohKjg4JOqysRpj+ncGBMNZFomIDjNuieRPQmkwunMm?=
 =?us-ascii?Q?0wyTkXvoSWDu1HBHCkws7JxFO0oaIh6L9+nCgbg9J7URSdq88HT7pTWS/EUH?=
 =?us-ascii?Q?UamcAt3n93nqxcscd4H2UxhtybmhnOnq6XmUCnTZwhnb8AmRI3ilk6RRu8Kf?=
 =?us-ascii?Q?ZfpCT8ln2qP9Y/c3YuE8OpWhFLeqz/6Tw9b/fJ4FBel9bqACPTkfWmxlVoCu?=
 =?us-ascii?Q?KgaukNrDD3zC2y4qb8713v7F/CoBXqjJoPtlybDZBOwWzqttD8773cv+weyM?=
 =?us-ascii?Q?lGQT0WcTFuRTTcDj0HP87ZVeXZiR2g/Li6Y1vERxiBHBkQH4XOc52VKn3EGa?=
 =?us-ascii?Q?VGFHjsCBH+TXzE99wcqvTtPm86fx3SDfIEVNOBICp478I+3wm7+gkuAarWvH?=
 =?us-ascii?Q?yPiJSF+vcEQ2lMQsMcFlcMF9rHXSH6NHUWpZ6f4bpBnSL+NNgZgvv/kaByLV?=
 =?us-ascii?Q?8FQol/WY7He8VBtWvyt9rFQc6aof1eYwzsqPH+PAbbrbO2S/QuLrAfpg25iG?=
 =?us-ascii?Q?oTBWsqmSVmeus6cB3GQ6S3QFOfQ1PyQmV5yKDFuWXThFUc8XvGaFVReu6iMm?=
 =?us-ascii?Q?4KNHzvRJ69a/5qn3sg0bTVjUUgS/yV2a9/7tD614MdQny+5CgMjKsnqmUEWt?=
 =?us-ascii?Q?MBxo4c67pu3c0IFr1Wv+pVPengoYnngAXHAf25MFynLU5ewYpkcrWnUDt020?=
 =?us-ascii?Q?ztA3iDFUDbQFsTK36Lqbu+1iGOHPtzjMCmRxgFZKPqxsaA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354ccf87-e8c4-4db3-b77f-08d90b9bb8b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2021 05:49:29.3323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l/qp5NKq7BBLjiPl+RGVjfqJhwDQpF9VRzH+/GIhbInuYrbj0P5wK8ddPp0cVvQI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3679
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Kuehling, 
 Felix" <Felix.Kuehling@amd.com>, "helgaas@kernel.org" <helgaas@kernel.org>
Content-Type: multipart/mixed; boundary="===============0566435973=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0566435973==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB4549AE4C448D5CDF3008707F975E9MN2PR12MB4549namp_"

--_000_MN2PR12MB4549AE4C448D5CDF3008707F975E9MN2PR12MB4549namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

That looks better to me :) As more things get added, I don't know how long =
you will be able to hold sw/hw cleanup separate and the name could confuse =
eventually.

Thanks,
Lijo

--_000_MN2PR12MB4549AE4C448D5CDF3008707F975E9MN2PR12MB4549namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<p style=3D"font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
That looks better to me :) As more things get added, I don't know how long =
you will be able to hold sw/hw cleanup separate and the name could confuse =
eventually.</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
<span style=3D"font-size: 12pt;"><br>
</span></div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
<span style=3D"font-size: 12pt;">Thanks,</span></div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"auto">Lijo</div>
</div>
</body>
</html>

--_000_MN2PR12MB4549AE4C448D5CDF3008707F975E9MN2PR12MB4549namp_--

--===============0566435973==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0566435973==--
