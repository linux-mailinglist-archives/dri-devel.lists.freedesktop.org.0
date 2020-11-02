Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A47EF2A3606
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 22:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F2A6E3D2;
	Mon,  2 Nov 2020 21:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271EC6E3D2
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 21:33:19 +0000 (UTC)
IronPort-SDR: zAAA/2EC9QmsWitY33nzh9mWLWlTjt1GvygrzO7QJfWIMPp20PHSzEtTh0Hv4cMr/yMB8GJXEa
 0ipLypeL+oYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9793"; a="186795857"
X-IronPort-AV: E=Sophos;i="5.77,446,1596524400"; d="scan'208";a="186795857"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2020 13:33:18 -0800
IronPort-SDR: hiTUw/vupFv3vMYRgnZSF3z9cUxAKOr5W7cz3MSjHLnSrPKm62EOgcvCqY2VhLhH5MSVkE1qCx
 RnpZ1m6PQJig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,446,1596524400"; d="scan'208";a="324984721"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 02 Nov 2020 13:33:18 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Nov 2020 13:33:17 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 2 Nov 2020 13:33:17 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 2 Nov 2020 13:33:17 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 2 Nov 2020 13:33:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mwc+HOA4v2tMuRW3J5swtsDtTQ2Hv6E6Vs/x5WIPb2hdc2pBzIFnde/IaiFxUOgr6K7Bz7RavsFpZXLu/U6WM1qCVHFTXpIclPUO3U9YGNP1QeaAD/HG4344EhgcZAYYJmyf2saFFBuhQ16cJyi/pM2vCsZwhx6nyeGSaWNJ20bsj5zJZh6AHCz2o6WW7McvWojoTlL50uwDk0+14um2F5kWdjNb8+CBnTpfbv1rFyoKrFERIaL1a4qwtsB+3TVOYACBvlY57rq5wHSF6ewgBo5vPD97eSouZIVgCnwsC4Lplu8cs/b8JoypDYNwNQakbm7wE7tjlz1wY0d96vEU0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLQdJusaUWA4reMwhkW7lpnCdIbOqCG1GK45lbbQwQI=;
 b=l3J7mCFsdKbzWoSSz2vX4saSFcdAA8zjrTP5B7bMu9ewEf8uYCkzwy2TwBS3r8g+lgFDa/iEH/htUI2lRu4SjAR+ocaPSjmRXsnesUAC6F4oVhrKVuXqstDoMeCkQ+kOZ4NaC1CBlN5xCrJ3I5FVHly55ICGtZTQBL77cYYYtRB0y4bblgxlJdOt0SftcnZ1jjNM2I96Qjx9MXMEkI3/KkvkkKz4Q/EAOJfbx4yWcbs/W3Ve89yuZMk6O3zZqykYTZ+PaecSsN3oBa+ngwhUbDlCn1Xt0TgbVr5Bsn6awR2/mvdl1qbyUXszijS0gxfslz6xB4SMmsTpInUVxkHWOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLQdJusaUWA4reMwhkW7lpnCdIbOqCG1GK45lbbQwQI=;
 b=u1Ra8LRZyG+/Qm5ntpBZ/TSD85OR4pRsDMDHVZxYBa8COPKZd5lw4iu9cc5J8tJKQXcfY0NW2aDSXUeXiwKwsvE31tqDPraSzQpTmiLfpLhwB1Pg+OE1q2lZB9EEicWPEoEnYiJLyyJRlUgRhLkg/Sbkyn4WHLhphhXPrvUKTY8=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR11MB0046.namprd11.prod.outlook.com (2603:10b6:301:67::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Mon, 2 Nov
 2020 21:33:09 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::8d73:60dd:89aa:99a9]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::8d73:60dd:89aa:99a9%8]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 21:33:09 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: RE: [bug report] dma-buf: Clarify that dma-buf sg lists are page
 aligned
Thread-Topic: [bug report] dma-buf: Clarify that dma-buf sg lists are page
 aligned
Thread-Index: AQHWsPCgeUEfUKgrXUWzIx4Ef+b+3am1XMYA
Date: Mon, 2 Nov 2020 21:33:08 +0000
Message-ID: <MW3PR11MB4555588F506D774990798A47E5100@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <20201102081508.GA104814@mwanda>
In-Reply-To: <20201102081508.GA104814@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.53.14.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 686b4476-9972-4c20-1e2f-08d87f76e4a1
x-ms-traffictypediagnostic: MWHPR11MB0046:
x-microsoft-antispam-prvs: <MWHPR11MB004659386FFD392F1EA39578E5100@MWHPR11MB0046.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AiE/WeJ5TwtSoaRo7QtbDUqPMoMqVH6QFDsYZID/3ag0gYCk0Csrhj5UdPfgBSJ/7l7bvv3qBjPVdHmHjtomqWoP7+U9NDcEsGLbdavCSkYYYcBH6vmxxQLQ30YgogcpDte2q6EFQ0mIGUaspgDumTsJejyUpnnsLwxvcn0dHGvaSWk1FeqN6aDZvVojVFiFh3GxvKGwkRt6duAE7AO+dhlsSW53zx/0xsm0k8/q8p0uYD6InpRGAXeyc2/MioLhG61DrTLOkalP2PcmK+dZul1rqRN9bIVLe1Pe3y317p2nKdPR6+NaydeGrYxSGFCSUMCnwma7DSnkyBCodzHIpQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(86362001)(55016002)(7696005)(26005)(33656002)(186003)(6916009)(53546011)(4326008)(71200400001)(9686003)(8936002)(66446008)(316002)(52536014)(66476007)(66946007)(64756008)(66556008)(8676002)(2906002)(5660300002)(478600001)(76116006)(6506007)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: vhWlFt1aSMbyxOe1j74l3bmRRt3xVzqRaoONt2BVgWCOPKR5K99cdSBUkfm6sgvmh+huRaOqW6j1qJZRjAnysW5i7CtiKw+FUM5CtculSJr2UMBbnp95a5l3SFj5yft+GYoZ/u7kOfTrioNPRVdS8G/lJVuI8CYLk6wrnWgeX26f5nUkTobABhTABaRgRWBPXCaObxbYlKg8p+7kHOEJVIxeJv2ihYYAya+JnrgxXz40IFIDl0Qpfzx5X0SdP+PuBXKu+RQ43IXcz5Dj5XMluCbyeAsPPh752NZf+eo/Fb5hdPuti1JTYlyd42cBqiQ7MSotPpKT4J6/KbBFLcrfyAaaKzEG0JFrd3iCTzW78tZ3ecizqThqA7VoGTCGFi4CtZDUv0CB5SfTuFBpNScVhshtRmbOnpgOQcxPHuYT9HokM4ANoSI1JHitOyYBzfzcm1+gHqrBYEG0xhnemJjBk7EKyt16o8/Cfl9CL56dfIgCtqUDYqa7Kw0bg9blJygx+yEH523tYFJ+ezm+RGFsDP/6Bjv0aGZie2sRz+rmAuzb2i8wTmuo/EhRSJ3Z5ki2Vp8nKMEXGb7Eym3Olz+v9sNLatD0AM5pb93N2K40o768VIaztPf0/1SnX4buUA3++Im/sSdI6wGH2EXxJErhxQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 686b4476-9972-4c20-1e2f-08d87f76e4a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2020 21:33:09.0403 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oryT3Tm1rFAlvhPknQITgVIjJRLWoVC32Rk6Gc8jk54rQkzt27gt6sqO8orSp79i6LhNYqcIspbkhZvlCg1m3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0046
X-OriginatorOrg: intel.com
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,

Thanks for reporting the bug. I see what was missing. Am I supposed to submit a patch to
replace the original patch or just to fix this bug?

Jianxin 

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: Monday, November 02, 2020 12:15 AM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Subject: [bug report] dma-buf: Clarify that dma-buf sg lists are page aligned
> 
> Hello Jianxin Xiong,
> 
> The patch ac80cd17a615: "dma-buf: Clarify that dma-buf sg lists are page aligned" from Oct 14, 2020, leads to the following static checker
> warning:
> 
> 	drivers/dma-buf/dma-buf.c:917 dma_buf_map_attachment()
> 	error: 'sg_table' dereferencing possible ERR_PTR()
> 
> drivers/dma-buf/dma-buf.c
>    897          sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
>    898          if (!sg_table)
>    899                  sg_table = ERR_PTR(-ENOMEM);
>    900
>    901          if (IS_ERR(sg_table) && dma_buf_is_dynamic(attach->dmabuf) &&
>    902               !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
>    903                  dma_buf_unpin(attach);
>    904
>    905          if (!IS_ERR(sg_table) && attach->dmabuf->ops->cache_sgt_mapping) {
>                     ^^^^^^^^^^^^^^^^^
> 
>    906                  attach->sgt = sg_table;
>    907                  attach->dir = direction;
>    908          }
>    909
>    910  #ifdef CONFIG_DMA_API_DEBUG
>    911          {
>    912                  struct scatterlist *sg;
>    913                  u64 addr;
>    914                  int len;
>    915                  int i;
>    916
>    917                  for_each_sgtable_dma_sg(sg_table, sg, i) {
>                                                 ^^^^^^^^^ Not checked here.
> 
>    918                          addr = sg_dma_address(sg);
>    919                          len = sg_dma_len(sg);
>    920                          if (!PAGE_ALIGNED(addr) || !PAGE_ALIGNED(len)) {
>    921                                  pr_debug("%s: addr %llx or len %x is not page aligned!\n",
>    922                                           __func__, addr, len);
>    923                          }
>    924                  }
>    925          }
>    926  #endif /* CONFIG_DMA_API_DEBUG */
> 
> regards,
> dan carpenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
