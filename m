Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0EA168B4B
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 01:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A386E4D0;
	Sat, 22 Feb 2020 00:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033986E4D7;
 Sat, 22 Feb 2020 00:53:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2020 16:53:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,470,1574150400"; d="scan'208";a="283867855"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Feb 2020 16:53:31 -0800
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 21 Feb 2020 16:53:31 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 21 Feb 2020 16:53:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdDU4VlZqOpeOY8RA0leC4DDdzL+dcwWikR0hAQZM9yTusOE9+GcfUSx4yXJAi9OlOa9lvULMUobU5L246pUB4cFxOLzIu4z5v86X+mUjuWUdGwD4+2S2oaB+jYS6ly5pjSvFQwzMbeGvdHH28Iq3UI6ZY7gHt21drwUTJ8tiw+cTzYCEWWfldbP3oz699R1undLlI0lZ9ABoSpy4u5L9zI1IUWKUgQvhUnOf3b9QRBYITNLvRiHmpqz3M+jXYaOtfQ8uosyuPGPzMYTUM23xfwFe6FDncVMaF7uR2YVvYv7DMf7jKTcAB2xQAhPsjYaaKneV5ZLiEULYPCnL/VUoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L54StEt7BT/1xJAdcy9jNb/UtECxFFs2eJJAy0+JL2c=;
 b=HE8J155cDwuJ0zIFeVs/XXND4xe0ayMZnYPckBRYhyZTu6yiVoUKN3X2bev4Aajq5+gY7LxuqnNcgYmOJZJYo8kE+VqB9/N5cUF/EtOFeYW/hbeBVw2rloNXRn5GVygLEEM2sYbONXeRPoNdQ9Hit0amKkegIzNgn8NWPfZSixlnFp4+gjjMsSHPOiA/nhJ+npUqNLdeoZf6SjxTWlLtM/P2Zt1b/l8/Zw0zKFA0m4N3M/vd0fEyTfZ4Q4GsIuXI80E681m+Kmjckwnkn+rOlHwS5KeYZc8oNfGWBRQtE8IaXqwjA8+E5zMXbxPjvXQT5WZY8hMDhWTeW2SsmgATHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L54StEt7BT/1xJAdcy9jNb/UtECxFFs2eJJAy0+JL2c=;
 b=jI4LbK8uHwomQCF0wCkOjTiOBzkjIiVk/4CVhb4LWUvsQ+C7y1pTsszNCyQl1sssJhcM3c1Jv/ncBwzgjVtTAmcvXU1zZPFQClxcUo6vBsZt6MCPcCmYP+GmG0Woy06RQuiOQfZCAlOtvNOV8WKKGBxPeuovQ4KJUMdyLNeka6g=
Received: from MWHPR11MB1245.namprd11.prod.outlook.com (2603:10b6:300:28::11)
 by MWHPR11MB1456.namprd11.prod.outlook.com (2603:10b6:301:b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.17; Sat, 22 Feb
 2020 00:53:29 +0000
Received: from MWHPR11MB1245.namprd11.prod.outlook.com
 ([fe80::1d85:409f:48ef:2d78]) by MWHPR11MB1245.namprd11.prod.outlook.com
 ([fe80::1d85:409f:48ef:2d78%9]) with mapi id 15.20.2750.021; Sat, 22 Feb 2020
 00:53:29 +0000
From: "Li, Juston" <juston.li@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sean@poorly.run" <sean@poorly.run>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v4 00/14] drm/i915: Add support for HDCP 1.4 over MST
 connectors
Thread-Topic: [PATCH v4 00/14] drm/i915: Add support for HDCP 1.4 over MST
 connectors
Thread-Index: AQHV5qdaIDwaFnen3UytPyNiC1tgS6gmZ64A
Date: Sat, 22 Feb 2020 00:53:29 +0000
Message-ID: <5bfd0d1e266b00029ee98e505fe4d3318a4787ea.camel@intel.com>
References: <20200218220242.107265-1-sean@poorly.run>
In-Reply-To: <20200218220242.107265-1-sean@poorly.run>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=juston.li@intel.com; 
x-originating-ip: [192.55.54.38]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d1f7f51-67ff-4e3c-7d02-08d7b731a20b
x-ms-traffictypediagnostic: MWHPR11MB1456:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1456BA51D7FEA79222924D28FDEE0@MWHPR11MB1456.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 03218BFD9F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(376002)(366004)(346002)(136003)(199004)(189003)(2616005)(66556008)(36756003)(66446008)(66476007)(64756008)(66946007)(478600001)(54906003)(86362001)(91956017)(76116006)(110136005)(2906002)(6486002)(6512007)(4326008)(5660300002)(8936002)(6506007)(8676002)(81166006)(26005)(81156014)(316002)(71200400001)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR11MB1456;
 H:MWHPR11MB1245.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XLAs9/k+9dO9bfcyZ/C7/7dfbCa8pqPjxyJsEYPcNPCMjYT6d5JoV4q3BXUKUxcgGxusmekUBR8sjwOFYZul49bJj1gvRXBYgg64rk3WfruU0L1MCfkgXi1u/0et/PA9LyaIMQ4xiOcy/MHw6iJ3mK7VUCq42zXW30BSyCF/AAg4LoY/KG6jk/J/kUD6wC3LYGs9PAX8TmoTaSm6tF3DYexEzoBSULLPNz5NcKyTinj5odo0ys8FnwNXZtidzu7hSbRHWqsclbTw9RDxITg3CgP6pyNv+w/yl7jsYF/hdX/dQonoAASAa7ZLsgtVzaBo3JLcwqP9vMEkT3miOPGmZJA86syUOz/GUX/1Wkej6lQAihuyPG/tfSwckzvp2pWdEq48V1tr1ObAT5AwpkIm6U8urHAua0p2OMXNYodyjsjQGV2t8Ta1Z4Nstj9TYabI
x-ms-exchange-antispam-messagedata: pKzgYzppOMqobFhINVwfewt8fPTXO6a6xeOCJ2AaP/v1X9MaZ4ASSUESuwiHI+7511QERL55ODoyKUVJ+6GQaB0hSYZMEjCif8fzWoO7+9HM2WephkrEbuUDbYHR7tZRAWMjYlD0Sxu557r3jKfgMQ==
Content-ID: <7A1F53E55728E3489203E4C3C143ED2A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d1f7f51-67ff-4e3c-7d02-08d7b731a20b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2020 00:53:29.3877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thDOJIuevQq072tRzUVboBZU/vaMSIt401cku6L88qW3r/qvijUs3WhCMZ4kunsZ0JNQnUZWaOipgsyM2BQt2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1456
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
Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2020-02-18 at 17:02 -0500, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Hey all,
> Back with a v4. Rebased on latest drm-tip.
> 
> Biggest change was adding the QUERY_STREAM_ENCRYPTION_STATUS check
> which
> ensures not only the link to the first branch is encrypted, but also
> that the channel iteself is also protected.
> 
> Sean
> 

nit, i915_display_info debugfs for intel_dp_mst_info() doesn't show
"HDCP version: "

Juston

> Sean Paul (14):
>   drm/i915: Fix sha_text population code
>   drm/i915: Clear the repeater bit on HDCP disable
>   drm/i915: WARN if HDCP signalling is enabled upon disable
>   drm/i915: Intercept Aksv writes in the aux hooks
>   drm/i915: Use the cpu_transcoder in intel_hdcp to toggle HDCP
>     signalling
>   drm/i915: Factor out hdcp->value assignments
>   drm/i915: Protect workers against disappearing connectors
>   drm/i915: Don't fully disable HDCP on a port if multiple pipes are
>     using it
>   drm/i915: Support DP MST in enc_to_dig_port() function
>   drm/i915: Use ddi_update_pipe in intel_dp_mst
>   drm/i915: Factor out HDCP shim functions from dp for use by dp_mst
>   drm/i915: Add connector to hdcp_shim->check_link()
>   drm/mst: Add support for QUERY_STREAM_ENCRYPTION_STATUS MST
> sideband
>     message
>   drm/i915: Add HDCP 1.4 support for MST connectors
> 
>  drivers/gpu/drm/drm_dp_mst_topology.c         | 117 +++
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  drivers/gpu/drm/i915/display/intel_ddi.c      |  26 +-
>  drivers/gpu/drm/i915/display/intel_ddi.h      |   2 +
>  .../drm/i915/display/intel_display_types.h    |  30 +-
>  drivers/gpu/drm/i915/display/intel_dp.c       | 620 +--------------
>  drivers/gpu/drm/i915/display/intel_dp.h       |   7 +
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 705
> ++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  15 +
>  drivers/gpu/drm/i915/display/intel_hdcp.c     | 199 +++--
>  drivers/gpu/drm/i915/display/intel_hdmi.c     |  23 +-
>  include/drm/drm_dp_helper.h                   |   3 +
>  include/drm/drm_dp_mst_helper.h               |  44 ++
>  include/drm/drm_hdcp.h                        |   3 +
>  14 files changed, 1127 insertions(+), 668 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_dp_hdcp.c
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
