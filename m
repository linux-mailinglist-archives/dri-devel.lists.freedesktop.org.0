Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB514FCE76
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 07:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48F510EE03;
	Tue, 12 Apr 2022 05:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-cusazon11020025.outbound.protection.outlook.com [52.101.61.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1F710E9C9
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 05:06:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zmg58cqVti8vo9sTjrGwEJyAj+oY/CCjSm7ZLV02LeeEU8D+0TYYTNycllgBaz7OfwykS0CCvYGaxWqehzgh7frPgzMjpBYH6qt7glCLvgjP+Ikat1dnBkvmE2/7UnnQmpLfoZ1MgWi1I9PTIHKD2WimedDc7AdBY+URBMoakkOaDhBva1QaIQaPtugUWi10r5jqogKbhNn8d61KcsCRKEomK01JeU+ZvbCegO/0T8GJ5HQqlhQoFORmX7RfFhFK8nyezjMSQXaUz9FBQLPPnX248IMJiHWdS585JbtdZ61hRxgLvbHiOgYv6+TG2ssIQECHhMNRQ0Gr5PQEl3ra3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ka0lOsR25RabCW49wARmKMEqpiSKmfdx/0LXxV1Onzs=;
 b=TO9hSa4HJ3lkStJeExRDbzaVR82nOIs9FzyeRq6XDOHjmIt3wnWWmklgO9z9NLIw2aGx55ZevQqZbU+eGsKh7KMQCzdWyJIYnvQs1M0dW8salsb3T/huobXTdDA21CmZGoEaXhgtXImf20awZnsY2C3AOAme9Vvc0uxMYgyIv5KKdM7f7SSdZruD7WsTzMPOUgL2Sff5+Vdvnn7Z0JEY2tKTZAoZc4ktIEeypNYbDeim4nnTJeWC6nKs22pot2qVFfism0YnRTQyE64or+05jV5gJ+nvAucLdXTE/V/kU9B/o0nAl3QIXN2U5JOeuXWJ3j3r1Bpltj7d3dt0DcUqlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ka0lOsR25RabCW49wARmKMEqpiSKmfdx/0LXxV1Onzs=;
 b=VcNZm14ZhnSUKuKBvl45CkR7n7fR8/hOPqu1q+9Dyp4ZuN/Kc2ADDWuNd+2Ly/QrSYvvvQ8Ip87LWED4+U5Qd5mY0UoVCu9bojUayO2ioht5OrcuKgabI/SZmHeLFIXX5jmi/0WyMrbxO6QX8EiXp0JkH469fPaPVrvJkDvik4c=
Received: from BYAPR21MB1270.namprd21.prod.outlook.com (2603:10b6:a03:105::15)
 by DM5PR21MB1592.namprd21.prod.outlook.com (2603:10b6:4:77::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.6; Tue, 12 Apr
 2022 05:06:08 +0000
Received: from BYAPR21MB1270.namprd21.prod.outlook.com
 ([fe80::31e4:d162:7b13:3cd3]) by BYAPR21MB1270.namprd21.prod.outlook.com
 ([fe80::31e4:d162:7b13:3cd3%4]) with mapi id 15.20.5186.006; Tue, 12 Apr 2022
 05:06:07 +0000
From: Dexuan Cui <decui@microsoft.com>
To: Saurabh Sengar <ssengar@linux.microsoft.com>, Saurabh Singh Sengar
 <ssengar@microsoft.com>, "drawat.floss@gmail.com" <drawat.floss@gmail.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Michael
 Kelley (LINUX)" <mikelley@microsoft.com>
Subject: RE: [PATCH v4] drm/hyperv: Add error message for fb size greater than
 allocated
Thread-Topic: [PATCH v4] drm/hyperv: Add error message for fb size greater
 than allocated
Thread-Index: AQHYTiXj2d8sLGFk5U+RLsD5mrWdR6zruPAg
Date: Tue, 12 Apr 2022 05:06:07 +0000
Message-ID: <BYAPR21MB127064CAEA28FBBFB34672C3BFED9@BYAPR21MB1270.namprd21.prod.outlook.com>
References: <1649737739-10113-1-git-send-email-ssengar@linux.microsoft.com>
In-Reply-To: <1649737739-10113-1-git-send-email-ssengar@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=dbc940bf-f58b-479c-9301-03c46a51c9b8;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-04-12T05:03:15Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff033b83-9bcc-41e9-dcbd-08da1c422745
x-ms-traffictypediagnostic: DM5PR21MB1592:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <DM5PR21MB159238F2070DF4A8ADD84615BFED9@DM5PR21MB1592.namprd21.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cX/2VLmElI7Hr88N6RrEXkobLzbj2P8OmaMH2oZr1xMljsEnzVh2h0+HM05eafTFsQTERx+SvD+nZLjgKfm2bKYfdk7oJ80AnkQQRo/z9qd1I/697m/QztR9yYmkC0FdU6NP2ru+Rn115GtcKMi/wZXdfdXWOdIOvVALUzOPlIkmAZIMGD36+wOfkXkbIEW8DFfM4qMPJtSnFr3yuAIE/FApbFFRBfS55hfxXk4FmQxohDoaiOaXdN21xFMGVZbEk1U+RXS3hdbiaZEuIuH3kZHexCZbbFrJ/BHNPIFmwWyLLymiTWRHH0PM/rmJ6PX359g9Tf5MVbjok/KaJZSohD2WGj4xYuGZoGS5Q3FaaVlIZpsOBaO8NSbZPJ7BRYldeQ/1obN8LVnflc+gPrT8ekRokDjbv/dN1n8iLclvf9tVsV1boqPGbL0SEE0sd9SzkevLNsxPmaB6IIdYF9o0+Uq5X0LXSqzZjWEkHG9h48D3T+if1EKNyjzt7q2CF4X2GHiq1UYtgVFClZ8wluGkjvr4jrKhQRrsrQTj4TwL0U7Kk+XhRX9dbqFFiQ9vbfMyBRruzld0BY65WCOA8F8YcTa9apH2mvLaFfyCLAUGyxQT+ED1u+UsUkr+Y1ZieCTD1a4LkN7albn6d4dIRbMZ5I9dDzu+jiV4zHSN7FYj6e/mPo/KtqYGNRFNFZ+7mzqXzYQxq0MwpocrXjuwrGyAD2B+B0znJUk6fyO7UPSmqoc7WUZY3vVYPV3+XaWi2oKm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR21MB1270.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(451199009)(64756008)(4744005)(8676002)(55016003)(6636002)(10290500003)(71200400001)(15650500001)(52536014)(82960400001)(8936002)(316002)(110136005)(66476007)(66946007)(66446008)(76116006)(508600001)(83380400001)(66556008)(5660300002)(2906002)(33656002)(186003)(26005)(9686003)(38070700005)(86362001)(6506007)(7696005)(8990500004)(122000001)(38100700002)(82950400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DfIO/Rey3/mmgvtZh6EOQulfQ5MZYe2blZOxk/OWi9+4mC17K2K2o5Flyd31?=
 =?us-ascii?Q?Ak5bhuMFuoyalZLtoxQ5HHhTb+A7nsImKwn48FonwPu4L5XOxjK1k8q5YPOz?=
 =?us-ascii?Q?PYl/AGAzhW4WSAw1pE4uXHofniXaN3Xv7BuPg88SrMY+mDPVUURqEuP4Qw8E?=
 =?us-ascii?Q?N92qgmbPCFvVaUvatGBQ+3xM6mokZAKu+R1/d1HUlT6msgVKxZhAGZRC09xc?=
 =?us-ascii?Q?N8X2ZX+0cfs5TN1xphczF3lY4FTirlihimy9hM8TSR46sYVmLs/5JfLjCsDW?=
 =?us-ascii?Q?QT9xi0dl2PUGvV7amQ0531WAiYZj3FgKdBwfFehINQKLwvfvKwzHB/NXXQe7?=
 =?us-ascii?Q?5o5JRpqxk0k/vgu4RmAqW1uSFJMfK7Cmtzpc0QKppEA3wjWaangxaCRNCOLg?=
 =?us-ascii?Q?kD4glvGkZQK0ThRzaeOwv6tbiZAuiySNT0WRL+81xUMA9AdUs9TbErCN639F?=
 =?us-ascii?Q?RN9+8s1wtaRezaNKx01FJW02XjYiqyqm6XFJZ+AZ7sWKY2UwicM8lOZ8qCjS?=
 =?us-ascii?Q?3qUEy6vfvzxOXYqdb2nFTOp2WOo4r7/Ih1X4giVmOyPLHCzu1YQy0S4bdy1F?=
 =?us-ascii?Q?P+339El4rVnXROB4iIukJW6HNk9c3no41QzUUA7jta5pX3g/jtVuLphiAfY8?=
 =?us-ascii?Q?pI2UKkB2rbLQsLCJVvILGzUT3PClFREl7wbVIZF1ey1uAJTWVJKKavRZO1xe?=
 =?us-ascii?Q?NuXc1Ky0W7wVaIOu7vF34vWJimuqZREJi9sWs48CVk7m2QzTewtrq6zXKRlS?=
 =?us-ascii?Q?p+EXrOiaiFiEzmOJTyoAUTBsXBgLGJM8Ir5tfRd1r0WfJW69s40HYyE6684j?=
 =?us-ascii?Q?N8vz0ap4IC+30bDBdTdBy7sjVG8BChDJIP34p5+7PsIDwpuKW43F54va/ldc?=
 =?us-ascii?Q?5upNr32+S4thHJ89ZQsRbSf329+Q/LJ4soQ77tDh1J8PM11QgnTWBZPI+ywe?=
 =?us-ascii?Q?2UattiUtHkR6P2/sAm9q1HDKHR9n85oqc2OF9UAp5wjbrQ9tOOVNIu0cUANI?=
 =?us-ascii?Q?uk/j5V6/arv1XXqNkzpOj+Bi7V5tnY8eG2kYzOaVRyxaQJqQYGChYzY+s15/?=
 =?us-ascii?Q?ZoN8XAnz6h2JuSdaazJOPbzAeojHsYDA0r1tBHnmkB5+n9Ng0jhm1cV0b9zK?=
 =?us-ascii?Q?sAwTHBm6P46LBg1ZmKO+65x4eqeEP4/vOoexG+V5kcYOSg0vdvgYBACrrVyd?=
 =?us-ascii?Q?KrCI2vqr5PY/MrakInJkddqbjxZl/wdNREduNz/wEzUuxvzMOt2gWAn+o1Tw?=
 =?us-ascii?Q?CNZnaAQTvKtzgPitW/JLMTPIoflrLh5gHUkLHDVvVDiwd7YP8dsUaQB9k9OX?=
 =?us-ascii?Q?d0l+BeqXZ8RyrzjmFfGORc1+BGovGqZFP5n/mWAuKfzkfGdH4KUD6vdcXrVR?=
 =?us-ascii?Q?aAEbEU3BZrV7jevnpjWfcJ0StmBZTf/bgZ+fkzG7HTP5sc7ptH7WnigeZpuP?=
 =?us-ascii?Q?uK+HSo7V1dq0rY1OzGFJ76P8PBB4BkoZdsRV/ZLJOYmEQasq+XoHBH880Uwn?=
 =?us-ascii?Q?/ArpvGQ4yktkf1qPa+hktudlUWd8lEB9z99/y55K0r2U2Tmo15JL/v3o6mJq?=
 =?us-ascii?Q?VnAjkuj1MyDGrcOC5XQtaNOHDdFav60edk+NMBkQC2ko7ZnRA4BSYY1AAC2n?=
 =?us-ascii?Q?kc6RxPup2BrbyMTguzJ0w1+7Iro0CWB5bjHa41iKHyDESQzbmVhJfnvOhq0Q?=
 =?us-ascii?Q?34+T2SO2/gyPnMvJHfOPeqSFToSawNfvLZh3VVcYTPAMX5Rbo2ZXlA8gGXn9?=
 =?us-ascii?Q?N2ga2AH6wA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR21MB1270.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff033b83-9bcc-41e9-dcbd-08da1c422745
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 05:06:07.8605 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d4O1VIThTX6xMOab9jHxiCQyXYnLvI68n03SDLVp3Y69Q86HEkaZWpZEPdrwcwfouAfwcMaWe8fWhKCgpNwKwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR21MB1592
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

> From: Saurabh Sengar <ssengar@linux.microsoft.com>
> Sent: Monday, April 11, 2022 9:29 PM
>  ...
> Add error message when the size of requested framebuffer is more than
> the allocated size by vmbus mmio region for framebuffer

The line lacks a period, but I guess the maintainer may help fix it for you=
 :-)
=20
> Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>

Reviewed-by: Dexuan Cui <decui@microsoft.com>
