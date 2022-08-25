Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4855A13BE
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 16:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4CC10E1E8;
	Thu, 25 Aug 2022 14:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-cusazon11020025.outbound.protection.outlook.com [52.101.61.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA60610E1E8
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 14:36:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+P5ZQzbfW35C+DrIfu5CYOCqVvczyLZK8k/xRfhBW7mZNLbfTU+lyptTsTZTA4ZN3/3JjTiWKYJN6w+jsCshdw13BvBfLBdKrXC88DDvgLezINE6DfJC91a1W+Aggpw91T/OWXXSVHLHMQCZ5s3uFZNJPuN/RrAeFIa7Q9LsFufKd2PFUgBjgWpm1cqCb/lDEmXlo5cWRueBMq7kdHZCxYppwDkkFyXWQ8CrBZE94o12k7LscB28GfMwZQCYMxOEh+QKOvdKhH5gpQ0y9pBL9OUnklVFJEo5/s50L5SL0jeS3xEieOiYI1GIKJNnYqOrLUyJhS5DJK3Pq/s5nA8Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjS6TnOVidFKjrL3+WBC7KNuSMv8ilGm6beIxzbCcwQ=;
 b=hKRroNsKxI/NL22DzRfn6aOWA4v0mFQsh+HKMXwwPUqVkpv+XEwpZATZL9fYkmPcaJS7VJkN5kDAtn8DmYZOVste1W/38mjEPI9R5S5opqkomNNCIr33P+AdklfzDGsw3478znkU9ZjQy8W2XeeZ1ViMohi8In6jZq9YEjt86R6LtRlT3YT41A5MhZkd7iq2OS6XZnjEJT8GD1hdlchHBYUiyIlySzDs6rAodoYxtaNYFd7CWWAFJrtRGCSGIUS4pjDo/8xcRRKIMhUrhGZZXvmDe9k0vG0vSAuWMGJ60UvlxvhekCmRsR6TRQHDWCw21+iQokjk4bds0320qqY/zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjS6TnOVidFKjrL3+WBC7KNuSMv8ilGm6beIxzbCcwQ=;
 b=Mw2lc1j+F439GkzPwY8gdQiLDxPvh2zEFjRuixiJbQY9tg2bC3YMRo1DvyaNl13ViVs3y5CuACMSmKQZZqQsml3UNFcmeDuWUVal36VtILHCwUNm7qiC3Xx3bZwja7BSDEzSN5RoRiX4/+DSMM2H4AhWS6j+A7deOUtw7Yd2r4k=
Received: from SN6PR2101MB1693.namprd21.prod.outlook.com
 (2603:10b6:805:55::19) by MN0PR21MB3312.namprd21.prod.outlook.com
 (2603:10b6:208:37d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.4; Thu, 25 Aug
 2022 14:36:50 +0000
Received: from SN6PR2101MB1693.namprd21.prod.outlook.com
 ([fe80::6485:465a:309a:2205]) by SN6PR2101MB1693.namprd21.prod.outlook.com
 ([fe80::6485:465a:309a:2205%9]) with mapi id 15.20.5588.004; Thu, 25 Aug 2022
 14:36:50 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: vkuznets <vkuznets@redhat.com>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] PCI: Move
 PCI_VENDOR_ID_MICROSOFT/PCI_DEVICE_ID_HYPERV_VIDEO definitions to pci_ids.h
Thread-Topic: [PATCH v2 1/3] PCI: Move
 PCI_VENDOR_ID_MICROSOFT/PCI_DEVICE_ID_HYPERV_VIDEO definitions to pci_ids.h
Thread-Index: AQHYuGEk+KlfmcwOjky7CHdwU8dS0a2/rw+g
Date: Thu, 25 Aug 2022 14:36:50 +0000
Message-ID: <SN6PR2101MB1693B7DEBA863782C652A45DD7729@SN6PR2101MB1693.namprd21.prod.outlook.com>
References: <20220825090024.1007883-1-vkuznets@redhat.com>
 <20220825090024.1007883-2-vkuznets@redhat.com>
In-Reply-To: <20220825090024.1007883-2-vkuznets@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=2fd5be80-01bd-4f8a-b4ca-e4e90684fdd0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-08-25T14:35:23Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ebb990ed-aeab-42d5-21c9-08da86a73f02
x-ms-traffictypediagnostic: MN0PR21MB3312:EE_
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yCFwIRFI7K1XasUkUqfnNrSTGUiS/pcIrSAdG5edQ2UBecEuuSV4gwQMxP7BBjOYEoTShaujmUSsdeJLL1jDrRB2BoXBuUyKNOErVH0AgJ1plwM1EBvX5qO5sTySJtv281wufQ1yyU3r+FLaBoCq9a9GrOQDJR9aT5cSUyE6NFSEuUZbcm8r4pwCd95IQW2aQa4cNVDOs+k36X6yoXdQUojmMCx5De9iRYWgte34+1n8mcKkKB5wLB5+SFSKZ2FDXIo8Sv7w8+L1G61SyLnQOxAMbQ4gj8uHX5yLgiJyrK7Kk0Wt9HMMBm4siSitIDhIXITQKXHPQzK8GbRAi49+86JxTpJf3fBu2j6feVjfo6v++ebW5llHEVUrMvt996vrUfcEpeh87eXO+6vit/PnKMm3xQc0AUzVEUl5SSY5z/BIi8pNxAuu8r+/8sViuZyc9xJObvp1Ex1Bu5mbzLbigBtWZ4f/iWPVLioLyRY3Ml8U4z7Jq1Xk6fQWC0bGQLv+daJuW+qqBIzIJR+9NYZKh1q+EW4QgpYCI956NRWuJJla83fTU80QQV7mg+HOiR/mm0KjGy3Sc9l3NPVacmAagyHQPqwSTsSzIkybajkmvEwrayiLcawzZYotCFd2qdp48xP9tHkseZyVpim/AWjHyJnMSGTCzNoHCpMuhAen8S1SEKU/Bt28xUwV6SIXq9iM2n0Hohbatv2DYwf/zpJoLv2l4n1YLfsq77AH+IJTmWysnIT2qMen0rIWZV76bmZdWaqwp1sc1ItIqmZjlEVmlJVZFrDI4DBYK07plgCgmfEfggcsA1rkABO/24iYTg7M
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR2101MB1693.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(47530400004)(451199009)(86362001)(82960400001)(82950400001)(38070700005)(122000001)(316002)(38100700002)(76116006)(54906003)(10290500003)(110136005)(66946007)(52536014)(2906002)(8936002)(5660300002)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(8990500004)(83380400001)(186003)(107886003)(41300700001)(71200400001)(7696005)(6506007)(9686003)(26005)(478600001)(55016003)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fBDS4uiiRVPFu6l+56lLu6f9ns1kLDVTEivEEAjj7BQcQxP4Hys28Z9DmTdm?=
 =?us-ascii?Q?y0FFp4ShgTv+rJdBPgcZj1SJCwedM/bxXt7/d5D/821yq4pvCIgqoOu9vUTv?=
 =?us-ascii?Q?wCctDB5CMT4vqHYtjuznfFgaYUyATQNbJYXfmzd/SLZnklf3PT3cunxK2Zy8?=
 =?us-ascii?Q?aXDy5zErGp385o/1JiadwJapFDU7UMKPCZE1JZQb/Jl5gknMxHiE/t3+/B6i?=
 =?us-ascii?Q?/8pDHXgSd6gyrL2UXcxSbG5MIxPiU3NlCwKSlqjXaxawMTU9PIxZEPdAiXAS?=
 =?us-ascii?Q?EuAOIuAwJwvMqa16/8wOhvCw60s0+KYNPV5Z+lD+D9THM9mGBK4BNzhipXXh?=
 =?us-ascii?Q?sgMQ4keJG3QexgKXV2TwrvcvSuChGKr7wX1LV2+yajAU9c/PUTOIOaBXkrgq?=
 =?us-ascii?Q?C47qKbxhiULDVTeq/1xwTrSmumylPf1OfYsOa9CYtDU97Mwy05f+50fy20DK?=
 =?us-ascii?Q?xrA47eYLueuD6ZHNbsiN9iMENcQGvIZQ4o7pi6Fz9MXHJ30Q0DbzBNyw+NeH?=
 =?us-ascii?Q?NFjQ5WzezLoWxQjETYdXHnVBLSQgSxrXIvtpn5V4AE5h0cxrCcKBBtfl0TNJ?=
 =?us-ascii?Q?tGRhLFmZ/FEL8g4WizhQeMU1l6Nj7UuwoVurH8cTRja1K/f4/x1AneJA7QhR?=
 =?us-ascii?Q?sb7qTIuBMitjNfhiS0cxBXEr93Il2pXx3cctdItFRY4qxEfnebhQSAMVuSqn?=
 =?us-ascii?Q?QYr30jJjG4QTceDYV4vTgqSJIi+HRgbe7Kwsd7fDtldi+M7lHKgygKAyNLS7?=
 =?us-ascii?Q?8ikzjNeB4QCmKDlW7VFDvTfyf46r8DozFiDrvyY7MrTsppssePzrkZSA905z?=
 =?us-ascii?Q?K3WXznk0WUCFqiZ2pOub0cgb2iBOLk9USfMgfqyfOs9C53W94XAIevc4SvTg?=
 =?us-ascii?Q?jyyzMYfEcONIxrVCOgM3mF/QPxekegOJXT9VVwFd+w0lMEzf99o3VU6HuoRP?=
 =?us-ascii?Q?gpkY5GoH0XL0bdx4UuqjlZryOcj4cxUWAUBQj39W4/b6+cQg0w+ndCf+PZPA?=
 =?us-ascii?Q?i/QOsp7VH4XyNBM5i1KgnEhfgWUxOD2qfXbEj4QLLJ/hDtH04Y0YP9O/i84V?=
 =?us-ascii?Q?vL6J8+0kh1unBFpmRz4doQzAO+rxWUYUW4rBHS1PA96RFVawpy//vly4GY/2?=
 =?us-ascii?Q?xfBzMqd5Oh5+NFxF+5iIhYFoK097I+x1Js8N25IAeEGDe+R9OgSAQSWzZrAc?=
 =?us-ascii?Q?eHMAv6BAoUr2J27lx865GzgB+vIUqw3NlwYwQfzOyLpjYFwc4NEZkB9kTPxo?=
 =?us-ascii?Q?PDfRqMD5XutT9zvNDIR6z/LWjFcKyXybQHBQeFAuE4RdhOhSZNavAUaC7Wg/?=
 =?us-ascii?Q?emrrV9IsqQm5k7xHAUIFPANv+Ym7lW2jaLwb1WpJE9W5UcwGXjC+89zB3321?=
 =?us-ascii?Q?dCdr0Ap/00hWXXoKIWvWrB6ggkGz8ey5wO9T+Q19S467jmBQkEo3DAlB3KWr?=
 =?us-ascii?Q?dU/yfcFM/dohX2pbFhb/Jwf0Ya5hBJmEKSmZshG9cHsjF2FvCWoRg1w15rvi?=
 =?us-ascii?Q?OhEs4SmcygfTkHFJvs2X8RKBjHS43Gdj/4H81a7R7XI6URBXB25/5Rf5CwT2?=
 =?us-ascii?Q?olQyOvAXQK0XBddIjlAxQqxCfpKk5RktehmnUav4zjIYoyrbmoE40pXyt4ao?=
 =?us-ascii?Q?7A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR21MB3312
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
Cc: Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Deepak Rawat <drawat.floss@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 KY Srinivasan <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vitaly Kuznetsov <vkuznets@redhat.com> Sent: Thursday, August 25, 202=
2 2:00 AM
>=20
> There are already three places in kernel which define PCI_VENDOR_ID_MICRO=
SOFT
> and two for PCI_DEVICE_ID_HYPERV_VIDEO and there's a need to use these
> from core Vmbus code. Move the defines where they belong.
>=20
> No functional change.
>=20
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c         | 3 ---
>  drivers/net/ethernet/microsoft/mana/gdma_main.c | 4 ----
>  drivers/video/fbdev/hyperv_fb.c                 | 4 ----
>  include/linux/pci_ids.h                         | 3 +++
>  4 files changed, 3 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> index 6d11e7938c83..40888e36f91a 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> @@ -23,9 +23,6 @@
>  #define DRIVER_MAJOR 1
>  #define DRIVER_MINOR 0
>=20
> -#define PCI_VENDOR_ID_MICROSOFT 0x1414
> -#define PCI_DEVICE_ID_HYPERV_VIDEO 0x5353
> -
>  DEFINE_DRM_GEM_FOPS(hv_fops);
>=20
>  static struct drm_driver hyperv_driver =3D {
> diff --git a/drivers/net/ethernet/microsoft/mana/gdma_main.c
> b/drivers/net/ethernet/microsoft/mana/gdma_main.c
> index 5f9240182351..00d8198072ae 100644
> --- a/drivers/net/ethernet/microsoft/mana/gdma_main.c
> +++ b/drivers/net/ethernet/microsoft/mana/gdma_main.c
> @@ -1465,10 +1465,6 @@ static void mana_gd_shutdown(struct pci_dev *pdev)
>  	pci_disable_device(pdev);
>  }
>=20
> -#ifndef PCI_VENDOR_ID_MICROSOFT
> -#define PCI_VENDOR_ID_MICROSOFT 0x1414
> -#endif
> -
>  static const struct pci_device_id mana_id_table[] =3D {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_MICROSOFT, MANA_PF_DEVICE_ID) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_MICROSOFT, MANA_VF_DEVICE_ID) },
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv=
_fb.c
> index 886c564787f1..b58b445bb529 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -74,10 +74,6 @@
>  #define SYNTHVID_DEPTH_WIN8 32
>  #define SYNTHVID_FB_SIZE_WIN8 (8 * 1024 * 1024)
>=20
> -#define PCI_VENDOR_ID_MICROSOFT 0x1414
> -#define PCI_DEVICE_ID_HYPERV_VIDEO 0x5353
> -
> -
>  enum pipe_msg_type {
>  	PIPE_MSG_INVALID,
>  	PIPE_MSG_DATA,
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index 6feade66efdb..15b49e655ce3 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -2079,6 +2079,9 @@
>  #define PCI_DEVICE_ID_ICE_1712		0x1712
>  #define PCI_DEVICE_ID_VT1724		0x1724
>=20
> +#define PCI_VENDOR_ID_MICROSOFT		0x1414
> +#define PCI_DEVICE_ID_HYPERV_VIDEO	0x5353
> +
>  #define PCI_VENDOR_ID_OXSEMI		0x1415
>  #define PCI_DEVICE_ID_OXSEMI_12PCI840	0x8403
>  #define PCI_DEVICE_ID_OXSEMI_PCIe840		0xC000
> --
> 2.37.1

Reviewed-by: Michael Kelley <mikelley@microsoft.com>

