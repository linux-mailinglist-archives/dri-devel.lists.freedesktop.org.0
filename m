Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 296F72950BF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 18:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C643F6EDCF;
	Wed, 21 Oct 2020 16:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E6B6EDCF;
 Wed, 21 Oct 2020 16:30:58 +0000 (UTC)
IronPort-SDR: bsPVV37kzUY+YmMhPZmD5zrDiiUAJUcFNOgWzXfdPSjedibX2oXYGZ4nyGvYO1aPFVc9onWa5E
 L5SmDCH4solQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="146688407"
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; d="scan'208";a="146688407"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2020 09:30:43 -0700
IronPort-SDR: 61Srs2vs/ES4Iarg8t6dDwOOiDG7E0QCeTdqIc6oC7mgZXWWxhthxLYe1LsvG48lOgIjPZRf5e
 HAqYPxMVDxKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; d="scan'208";a="533591284"
Received: from irsmsx603.ger.corp.intel.com ([163.33.146.9])
 by orsmga005.jf.intel.com with ESMTP; 21 Oct 2020 09:30:42 -0700
Received: from hasmsx602.ger.corp.intel.com (10.184.107.142) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 21 Oct 2020 17:30:41 +0100
Received: from hasmsx602.ger.corp.intel.com ([10.184.107.142]) by
 HASMSX602.ger.corp.intel.com ([10.184.107.142]) with mapi id 15.01.1713.004;
 Wed, 21 Oct 2020 19:30:40 +0300
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 09/15] misc/mei/hdcp: Fix AUTH_STREAM_REQ cmd buffer len
Thread-Topic: [PATCH v2 09/15] misc/mei/hdcp: Fix AUTH_STREAM_REQ cmd buffer
 len
Thread-Index: AQHWpufsfNKyarP4z0uf8+3JcaA4gqmgnrQAgAGYOtA=
Date: Wed, 21 Oct 2020 16:30:40 +0000
Message-ID: <893382423183475abc19a3cbd9777a73@intel.com>
References: <20201020133906.23710-1-anshuman.gupta@intel.com>
 <20201020133906.23710-10-anshuman.gupta@intel.com> <87tuuo929d.fsf@intel.com>
In-Reply-To: <87tuuo929d.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.184.70.1]
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
Cc: "seanpaul@chromium.org" <seanpaul@chromium.org>, "Li,
 Juston" <juston.li@intel.com>, "Gupta, 
 Anshuman" <anshuman.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> 
> On Tue, 20 Oct 2020, Anshuman Gupta <anshuman.gupta@intel.com> wrote:
> > Fix the size of WIRED_REPEATER_AUTH_STREAM_REQ cmd buffer size.
> > It is based upon the actual number of MST streams and size of
> > wired_cmd_repeater_auth_stream_req_in.
> > Excluding the size of hdcp_cmd_header.
> >
> > Cc: Tomas Winkler <tomas.winkler@intel.com>
> > Cc: Ramalingam C <ramalingam.c@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> 
> Tomas, ack to merge this via drm-intel?

I have no problem with merging it via drm-intel,  just see a little nitpick bellow:
> Thanks,
> Jani.
> 
> > ---
> >  drivers/misc/mei/hdcp/mei_hdcp.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/misc/mei/hdcp/mei_hdcp.c
> > b/drivers/misc/mei/hdcp/mei_hdcp.c
> > index 9ae9669e46ea..b10d266fb60a 100644
> > --- a/drivers/misc/mei/hdcp/mei_hdcp.c
> > +++ b//
> > @@ -569,8 +569,7 @@ static int mei_hdcp_verify_mprime(struct device
> *dev,
> >  	verify_mprime_in->header.api_version = HDCP_API_VERSION;
> >  	verify_mprime_in->header.command_id =
> WIRED_REPEATER_AUTH_STREAM_REQ;
> >  	verify_mprime_in->header.status = ME_HDCP_STATUS_SUCCESS;
> > -	verify_mprime_in->header.buffer_len =
> > -
> 	WIRED_CMD_BUF_LEN_REPEATER_AUTH_STREAM_REQ_MIN_IN;
> > +	verify_mprime_in->header.buffer_len = cmd_size  - sizeof(struct
> > +hdcp_cmd_header);

 I believe the following annotation would be  preferable: 
	cmd_size - sizeof(verify_mprime_in->header)

> >
> >  	verify_mprime_in->port.integrated_port_type = data->port_type;
> >  	verify_mprime_in->port.physical_port = (u8)data->fw_ddi;
> 
> --
> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
