Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1199172C70
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 00:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD8A6ED90;
	Thu, 27 Feb 2020 23:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D894F6ED8F;
 Thu, 27 Feb 2020 23:42:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 15:42:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,493,1574150400"; d="scan'208";a="232364583"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
 by fmsmga008.fm.intel.com with ESMTP; 27 Feb 2020 15:42:45 -0800
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 27 Feb 2020 15:42:44 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 27 Feb 2020 15:42:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZ/js3DuHJUpHv0S+jUvcXC1Vnl5Hq2uw7HCCEK6K4HSTV0zdsDOq3XzCIo3FKsEIBGD2UUpmf2VQsq/9LjoLxjmjZL+/aEtli1XxO6mil+JBGgTCz9zjHoth1zv2S6lmDbVhJ8kf9cOj0M0ldFWiZhfioudgJXGsLb3xQRqVsKy3/yiItg52pqq9FZYI1QfMV8hLdTPq/JEx6vIL3y2p3KWcVQsOVkGsnqCYbUMGTwYEh80Ql3avOwIS0ypvYDvfiNO4k0CqVEMRR6KVrXinvTbrOI8xTJJ1Ux9Sd+aRZKH7NKy02W5wEkeJk899btdjM2t+ahtApANegkCn5zxqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5q7z904DnN/rY4caWR7N0GzEMqSmkn7YiIOyMRbLnT4=;
 b=BTzZOHZyKc7dtqHFsRIAciWwEkAZ2l5c6WYZ67+Oaaril3PYgr1OOHsve9sKu8t1OUtAkoSSW7b1M+o62YQMNp1pFv+lKqCBuNG/3fL2ss2ruhuqMVjMUVguAEk5P5J4xg8rMkyN/jpdi75qYYkdTvghnHibhia+FqrbPpmufemFvNoYBzycIISiA4qSzjztxEaQ8/jZRgZSBOuCib9ZLYxnUQYdvSduU2yfepmR8jfOxIHxb4ATWvfCTctvIXSTZJ9eZtzpckKyDIjjh0NWhNS7MgvJGkavehtHETCvtWceGgWO5FCStlzuXoDExCV5U9dHgCcta4A9gv0ATOoKpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5q7z904DnN/rY4caWR7N0GzEMqSmkn7YiIOyMRbLnT4=;
 b=Dgy8ua1IzhaWllAIzzYVjZn5SeDOlZqAZXZ6+GpuL7U3ixvlM7a7iOXTPsxuHoRSXZRplNS7bo3D6sSHQrHI+outkLDgStAqdb/lQrj6er2SoHrVOYEkuGKEqZrnOUkTY0kQXIeAgL/ry/WI0o/MgFKQHgUYX/tajFUOLY7UyXs=
Received: from CY4PR11MB1240.namprd11.prod.outlook.com (2603:10b6:903:23::13)
 by CY4PR11MB1253.namprd11.prod.outlook.com (2603:10b6:903:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Thu, 27 Feb
 2020 23:42:43 +0000
Received: from CY4PR11MB1240.namprd11.prod.outlook.com
 ([fe80::3165:923e:7246:95d7]) by CY4PR11MB1240.namprd11.prod.outlook.com
 ([fe80::3165:923e:7246:95d7%12]) with mapi id 15.20.2772.012; Thu, 27 Feb
 2020 23:42:43 +0000
From: "Li, Juston" <juston.li@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sean@poorly.run" <sean@poorly.run>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v4 13.5/14] drm/i915: Print HDCP version info for all
 connectors
Thread-Topic: [PATCH v4 13.5/14] drm/i915: Print HDCP version info for all
 connectors
Thread-Index: AQHV7Z/LUkjjXur6n0G/0jM/twMBt6gvs/QA
Date: Thu, 27 Feb 2020 23:42:43 +0000
Message-ID: <4d20d6667c0157c2b0e23858560784f8e17208f6.camel@intel.com>
References: <5bfd0d1e266b00029ee98e505fe4d3318a4787ea.camel@intel.com>
 <20200227185714.171466-1-sean@poorly.run>
In-Reply-To: <20200227185714.171466-1-sean@poorly.run>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=juston.li@intel.com; 
x-originating-ip: [192.55.54.38]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dab45a71-db1f-4c84-a33b-08d7bbdebd6f
x-ms-traffictypediagnostic: CY4PR11MB1253:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR11MB1253423613AF51DB49CBFA4FFDEB0@CY4PR11MB1253.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 03264AEA72
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(396003)(366004)(376002)(39860400002)(199004)(189003)(478600001)(2906002)(5660300002)(64756008)(66446008)(66476007)(6486002)(186003)(86362001)(76116006)(36756003)(66946007)(91956017)(6512007)(81156014)(26005)(6506007)(110136005)(54906003)(2616005)(71200400001)(4326008)(8936002)(66556008)(8676002)(81166006)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR11MB1253;
 H:CY4PR11MB1240.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HvnzMuJol1qDAhqJWEGz+y5WK1OB43IwFtQm3hggjPH/h5/2WqHk99nSWXvXsqbMMnwLWpwIePK25Fjf5xI+Tzm4O5kGMxWUgULs2+y0RtokCpIZXa6y4QpwiDmGiamZn94k559IP3G0p4JFoyCOkm1SOGf54ySFlraj2zrLNcrYBdKC0w6HMZc0gFt7Var6LCJ9zI2PK/1/5/W0w1BOHrKunS98yABK1bkNVb0K9okYMuutCWeKGsxhcwt1mxonevsoR8t6orOjoLZfx+aOxAm0s0ZR0YvoO8PeI/nL3Q0enZqEokqIB8wIajHZIQqv3La9mVabEibXNiKEPDSWUW8qNDQ6xW/HfIhfIB1t21SNHE1r016i5uDdtJE4HrCi7IxjwaHaIDzhWuQxJQYe+wpZS26Hjtcm8kS2ESXBmjKDn5SnrFmAZNGPCPNAJ5Ss
x-ms-exchange-antispam-messagedata: PTpZ6weVPxsL0y3T5WAt/Grgzr//IsbXgSSP8A12lKKi3b2ZGllbmM1IysC6FC6Zw7+qcR9Dizv8KFXCVNi6Ot6MncPX0umUTbDIfnedn54K1PY5uPZbBSVn3JEKK5HeSkgD+m1UkDqtflXC5aPRuw==
Content-ID: <014CC00FBB34174D9D79B9A2EBF99996@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: dab45a71-db1f-4c84-a33b-08d7bbdebd6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2020 23:42:43.0688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +HxWbE6KYdNkI8yZxS5RqjS7FzKWAHmR5WT2xkl4sk2ZNK59lbc/qmbH9czVD9NGml1t38D9op1Ny7ezuug1wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1253
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-02-27 at 13:56 -0500, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> De-duplicate the HDCP version code and print it for all connectors.
> 
> Cc: Juston Li <juston.li@intel.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> 
> Changes in v4:
> - Added to the set

LGTM, thanks for adding this!
Reviewed-by: Juston Li <juston.li@intel.com>

> ---
>  .../drm/i915/display/intel_display_debugfs.c    | 17 +++++++++----
> ----
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index 46954cc7b6c01..eb948a14cfd61 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -597,6 +597,11 @@ static void intel_hdcp_info(struct seq_file *m,
>  {
>  	bool hdcp_cap, hdcp2_cap;
>  
> +	if (!intel_connector->hdcp.shim) {
> +		seq_puts(m, "No Connector Support");
> +		goto out;
> +	}
> +
>  	hdcp_cap = intel_hdcp_capable(intel_connector);
>  	hdcp2_cap = intel_hdcp2_capable(intel_connector);
>  
> @@ -608,6 +613,7 @@ static void intel_hdcp_info(struct seq_file *m,
>  	if (!hdcp_cap && !hdcp2_cap)
>  		seq_puts(m, "None");
>  
> +out:
>  	seq_puts(m, "\n");
>  }
>  
> @@ -624,10 +630,6 @@ static void intel_dp_info(struct seq_file *m,
>  
>  	drm_dp_downstream_debug(m, intel_dp->dpcd, intel_dp-
> >downstream_ports,
>  				&intel_dp->aux);
> -	if (intel_connector->hdcp.shim) {
> -		seq_puts(m, "\tHDCP version: ");
> -		intel_hdcp_info(m, intel_connector);
> -	}
>  }
>  
>  static void intel_dp_mst_info(struct seq_file *m,
> @@ -651,10 +653,6 @@ static void intel_hdmi_info(struct seq_file *m,
>  	struct intel_hdmi *intel_hdmi =
> enc_to_intel_hdmi(intel_encoder);
>  
>  	seq_printf(m, "\taudio support: %s\n", yesno(intel_hdmi-
> >has_audio));
> -	if (intel_connector->hdcp.shim) {
> -		seq_puts(m, "\tHDCP version: ");
> -		intel_hdcp_info(m, intel_connector);
> -	}
>  }
>  
>  static void intel_lvds_info(struct seq_file *m,
> @@ -710,6 +708,9 @@ static void intel_connector_info(struct seq_file
> *m,
>  		break;
>  	}
>  
> +	seq_puts(m, "\tHDCP version: ");
> +	intel_hdcp_info(m, intel_connector);
> +
>  	seq_printf(m, "\tmodes:\n");
>  	list_for_each_entry(mode, &connector->modes, head)
>  		intel_seq_print_mode(m, 2, mode);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
