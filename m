Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EFB243492
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 09:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CDA6E526;
	Thu, 13 Aug 2020 07:12:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BB76E0CF;
 Thu, 13 Aug 2020 06:32:33 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D6MVTC013413; Thu, 13 Aug 2020 06:32:29 GMT
Received: from eur03-am5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2057.outbound.protection.outlook.com [104.47.8.57])
 by mx0a-0039f301.pphosted.com with ESMTP id 32v9ptb7gg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 06:32:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QW9AqrMSjyT96t7PkEMt0KOiNIHl4RfWc8BIttPu8BCyM62/b5mBw6Ct5AkSJ6Jf3WxCVKaccny15ktRFhkhEDAQGLgQXFZaSJuZpIXHh31Pt2FhPnt3OG73Mjf/FNgGOc0GEV+5Xci8I8DoEoaWeJRN110QaJ1rF8gurMp3l50/L/Lc2FqiQQfVJDIbxKjiyZi7Znyc7FeNo3j/EM8IvnqjCpd3kzQQJAc4cSIRo1PBkvx46waCliMOTZp9fvSAy2nTgp6edOoi2N5RdxXFAIZkBtgGxRSG6mDnktrh1RMQflngK32BS08G/mhzcmtnu0yAj3ufXS4Z83wxAS22ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUG4qciZFWVY40UK+zGnDDQlKG0HkTB5KIEbuRNNetc=;
 b=BeIisR97fwNi1lCPw9L9frP/Gg57fAX35CsukY7LL7FrklRBwD0BLCIrHaWJeD0efTMwzTfj0Fhc+vARpNxDHijodgRjEcVbv0g/D2WZxyyHaCIhTDALC/eG5Qt4nUNuWuSBFPRugCYKb9xHnbAjAx/B8nsmh4LIqW0ahJCjxQOFNOAAVcFvqJeBmW4JWujjikOj1DVPeH0jK7N0i+j314r61Vw+T6YDUKG0UgoLRHS1uehYMFDn9OtlKgQtu2uS21GdJaJZrwKdtuBybXsUwc5J14IgL8YHEo2xF6izZslj42LHUBrAVKRQkF3If1nuOF9DrC5pke7fmj6tFbHTtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUG4qciZFWVY40UK+zGnDDQlKG0HkTB5KIEbuRNNetc=;
 b=SGTius+w2JvhIgDjFugOrWMpv19c8WaH6THsua1b37xyd9uzRGkJpKenCm1vi1R6h/tOwZFFFGkTEX8Uzfkxai4v6ek8DjevHFjn345x0MmHXJrR1dzydjyVE3a1d4u5nSRScbXiZ79e6ZzpyxCToui2M75zQO6b4LNpPfFnUu4CikEHimnay2yVH4iT+h2dfV9NKKgFGlS+051xZem771RV826muSdFKgZ0KtqRcaRzb58H/WhgXGnYe5bNgd83sFzgS8IJvJ8KTN6YfD838AdRlW3ugdcifd0ygvUQWWhrwIVhObVnz1Kd5kDwcrFoEUaFvP8G4PObN7Qx2Wnb8w==
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5554.eurprd03.prod.outlook.com (2603:10a6:208:176::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Thu, 13 Aug
 2020 06:32:25 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::21e5:6d27:5ba0:f508]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::21e5:6d27:5ba0:f508%9]) with mapi id 15.20.3261.026; Thu, 13 Aug 2020
 06:32:25 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "jgross@suse.com" <jgross@suse.com>
Subject: Re: [PATCH v2 0/5] Fixes and improvements for Xen pvdrm
Thread-Topic: [PATCH v2 0/5] Fixes and improvements for Xen pvdrm
Thread-Index: AQHWcTn137mCP9TL7kicuRLSt2qi/qk1lI+A
Date: Thu, 13 Aug 2020 06:32:25 +0000
Message-ID: <7c8cb6e9-8270-d27a-6480-793ef5599d09@epam.com>
References: <20200813062113.11030-1-andr2000@gmail.com>
In-Reply-To: <20200813062113.11030-1-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c99856f2-6009-4360-97fc-08d83f52a4c6
x-ms-traffictypediagnostic: AM0PR03MB5554:
x-microsoft-antispam-prvs: <AM0PR03MB5554779618B8905593FF9E84E7430@AM0PR03MB5554.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR03MB6324.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(36756003)(2616005)(91956017)(76116006)(53546011)(6506007)(316002)(66476007)(478600001)(66556008)(66946007)(64756008)(66446008)(7416002)(5660300002)(31686004)(186003)(8676002)(6512007)(2906002)(966005)(6486002)(8936002)(83380400001)(31696002)(86362001)(26005)(4326008)(110136005)(54906003)(71200400001)(17423001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-transport-forked: True
Content-ID: <43EAECDDFA871B46B0F3D5560854501F@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c99856f2-6009-4360-97fc-08d83f52a4c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2020 06:32:25.6027 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NnxYaG79aAzCpN2Ps8hzISGrGH9ZTuBY+Hzm0tRrM4j5FdLfeTa+0JHzae25q0pT2nCXCYu2fMFtcicr7RAAVxwtse2KiWP/tjcFsK1UtmXNF18EbMybRVVjZ7p/DJsD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5554
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_04:2020-08-13,
 2020-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008130048
X-Mailman-Approved-At: Thu, 13 Aug 2020 07:12:31 +0000
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Juergen, Boris,

can we please merge these via Xen Linux tree as I have collected enough Ack/R-b?

The series has DRM patches, but those anyway are Xen related, so I think

this should be fine from DRI point of view.

Thank you,

Oleksandr

On 8/13/20 9:21 AM, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>
> Hello,
>
> This series contains an assorted set of fixes and improvements for
> the Xen para-virtualized display driver and grant device driver which
> I have collected over the last couple of months:
>
> 1. Minor fixes to grant device driver and drm/xen-front.
>
> 2. New format (YUYV) added to the list of the PV DRM supported formats
> which allows the driver to be used in zero-copying use-cases when
> a camera device is the source of the dma-bufs.
>
> 3. Synchronization with the latest para-virtualized protocol definition
> in Xen [1].
>
> 4. SGT offset is now propagated to the backend: while importing a dmabuf
> it is possible that the data of the buffer is put with offset which is
> indicated by the SGT offset. This is needed for some GPUs which have
> non-zero offset.
>
> Thank you,
> Oleksandr Andrushchenko
>
> [1] https://urldefense.com/v3/__https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=c27a184225eab54d20435c8cab5ad0ef384dc2c0__;!!GF_29dbcQIUBPA!iAHOdk4M167VNM1AypMGVmyKJu-iqC9e5cXyu6N595Np3iyIZDnZl0MIBX3IROJSD1GSMX_GfQ$ [xenbits[.]xen[.]org]
>
> Changes since v1:
> =================
>
> 1. Removed patch which adds EDID to PV DRM as it needs more time for review:
> "5. Version 2 of the Xen displif protocol adds XENDISPL_OP_GET_EDID
> request which allows frontends to request EDID structure per
> connector. This request is optional and if not supported by the
> backend then visible area is still defined by the relevant
> XenStore's "resolution" property.
> If backend provides EDID with XENDISPL_OP_GET_EDID request then
> its values must take precedence over the resolutions defined in
> XenStore."
> I will send this as a dedicated patch.
>
> 2. Added missing CC stable for the patches with fixes
>
> Oleksandr Andrushchenko (5):
>    xen/gntdev: Fix dmabuf import with non-zero sgt offset
>    drm/xen-front: Fix misused IS_ERR_OR_NULL checks
>    drm/xen-front: Add YUYV to supported formats
>    xen: Sync up with the canonical protocol definition in Xen
>    drm/xen-front: Pass dumb buffer data offset to the backend
>
>   drivers/gpu/drm/xen/xen_drm_front.c      | 10 +--
>   drivers/gpu/drm/xen/xen_drm_front.h      |  2 +-
>   drivers/gpu/drm/xen/xen_drm_front_conn.c |  1 +
>   drivers/gpu/drm/xen/xen_drm_front_gem.c  | 11 +--
>   drivers/gpu/drm/xen/xen_drm_front_kms.c  |  2 +-
>   drivers/xen/gntdev-dmabuf.c              |  8 +++
>   include/xen/interface/io/displif.h       | 91 +++++++++++++++++++++++-
>   7 files changed, 111 insertions(+), 14 deletions(-)
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
