Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 547FE3470A1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 06:06:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85516E977;
	Wed, 24 Mar 2021 05:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD71D6E977;
 Wed, 24 Mar 2021 05:05:55 +0000 (UTC)
IronPort-SDR: MMRG45ndqmJOJw7oy5ileoYyxJ0DDtAcz8oBvgEj0HUaOdWyCC+yf3sF8DCQ6RYkdlqYwiyDnP
 2oKGmgvaSntQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="190661284"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="190661284"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 22:05:54 -0700
IronPort-SDR: D6vxC8LksDtr/uoRLoPB6Lniz3JlLh1GgoRa6OYsjDIUdnWAbRNtkiCWNkrft8BFr3kichTBAP
 wrfRkkdPrmcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="413646740"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 23 Mar 2021 22:05:54 -0700
Received: from bgsmsx606.gar.corp.intel.com (10.67.234.8) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 23 Mar 2021 22:05:53 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX606.gar.corp.intel.com (10.67.234.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 24 Mar 2021 10:35:51 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2106.013;
 Wed, 24 Mar 2021 10:35:51 +0530
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Lankhorst, Maarten" <maarten.lankhorst@intel.com>
Subject: RE: [Intel-gfx] [PATCH 2/2] drm/hdcp: DP HDCP2.2 errata
 LC_Send_L_Prime=16
Thread-Topic: [Intel-gfx] [PATCH 2/2] drm/hdcp: DP HDCP2.2 errata
 LC_Send_L_Prime=16
Thread-Index: AQHW9IfjBXWnDhrQZUauSlTBOSfEnqqSi9CAgABgphA=
Date: Wed, 24 Mar 2021 05:05:51 +0000
Message-ID: <b1346613979849539857eb2814daecc9@intel.com>
References: <20210127082437.31339-1-anshuman.gupta@intel.com>
 <20210127082437.31339-3-anshuman.gupta@intel.com>
 <f5ac828c-3297-1984-d85f-10545ffa3338@intel.com>
In-Reply-To: <f5ac828c-3297-1984-d85f-10545ffa3338@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.223.10.1]
MIME-Version: 1.0
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>
> Sent: Wednesday, March 24, 2021 10:16 AM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
> gfx@lists.freedesktop.org
> Subject: Re: [Intel-gfx] [PATCH 2/2] drm/hdcp: DP HDCP2.2 errata
> LC_Send_L_Prime=16
> 
> Change is as per the errata. LGTM.
> 
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Hi  Maarten ,
Could you please provide your Ack to merge it via drm-intel-next,  since it is a small change.
Thanks,
Anshuman Gupta.
> 
> On 1/27/2021 1:54 PM, Anshuman Gupta wrote:
> > Fix LC_Send_L_Prime message timeout to 16 as documented in DP HDCP 2.2
> > errata page 3.
> >
> > https://www.digital-cp.com/sites/default/files/HDCP%202_2_DisplayPort_
> > Errata_v3_0.pdf
> >
> > Cc: Ramalingam C <ramalingam.c@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >   include/drm/drm_hdcp.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h index
> > 2b165a0f434f..0b1111e3228e 100644
> > --- a/include/drm/drm_hdcp.h
> > +++ b/include/drm/drm_hdcp.h
> > @@ -231,7 +231,7 @@ struct hdcp2_rep_stream_ready {
> >   #define HDCP_2_2_PAIRING_TIMEOUT_MS		200
> >   #define HDCP_2_2_DP_PAIRING_READ_TIMEOUT_MS	5
> >   #define	HDCP_2_2_HDMI_LPRIME_TIMEOUT_MS		20
> > -#define HDCP_2_2_DP_LPRIME_TIMEOUT_MS		7
> > +#define HDCP_2_2_DP_LPRIME_TIMEOUT_MS		16
> >   #define HDCP_2_2_RECVID_LIST_TIMEOUT_MS		3000
> >   #define HDCP_2_2_STREAM_READY_TIMEOUT_MS	100
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
