Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B44FE29A4CC
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 07:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA806EB0E;
	Tue, 27 Oct 2020 06:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611AF6EB0E;
 Tue, 27 Oct 2020 06:39:51 +0000 (UTC)
IronPort-SDR: CfjtrcaUY1WqeAnSUxEs3YZuNzEEnsXH0z62xRrCNPNmUmrKeOo5EStxrixaIpiLdppFJdTbgZ
 MVyPiuX7eSew==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="147889534"
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="147889534"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 23:39:51 -0700
IronPort-SDR: Gy2vE0Oxyb7kamYxtFtvHpJP62EwVA2CF/ve97j/FrwNgfsnM/87ScOwEm6mYzNsKNMlUZszDl
 7neiKFQb8mbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="424321778"
Received: from irsmsx602.ger.corp.intel.com ([163.33.146.8])
 by fmsmga001.fm.intel.com with ESMTP; 26 Oct 2020 23:39:50 -0700
Received: from hasmsx602.ger.corp.intel.com (10.184.107.142) by
 irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 06:39:49 +0000
Received: from hasmsx602.ger.corp.intel.com ([10.184.107.142]) by
 HASMSX602.ger.corp.intel.com ([10.184.107.142]) with mapi id 15.01.1713.004;
 Tue, 27 Oct 2020 08:39:48 +0200
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v3 10/16] misc/mei/hdcp: Fix AUTH_STREAM_REQ cmd buffer len
Thread-Topic: [PATCH v3 10/16] misc/mei/hdcp: Fix AUTH_STREAM_REQ cmd buffer
 len
Thread-Index: AQHWqTkDM7Dyska5jE2PoQ41t3V3qKmq4ucAgAAid0A=
Date: Tue, 27 Oct 2020 06:39:48 +0000
Message-ID: <80ba261b4dc9451c9976bf5262509e50@intel.com>
References: <20201023122112.15265-1-anshuman.gupta@intel.com>
 <20201023122112.15265-11-anshuman.gupta@intel.com>
 <548c9b75171149d9a0d5d242e09361e8@intel.com>
In-Reply-To: <548c9b75171149d9a0d5d242e09361e8@intel.com>
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>, "Li, 
 Juston" <juston.li@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> 
> 
> 
> > -----Original Message-----
> > From: Anshuman Gupta <anshuman.gupta@intel.com>
> > Sent: Friday, October 23, 2020 5:51 PM
> > To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> > Cc: seanpaul@chromium.org; Nikula, Jani <jani.nikula@intel.com>; C,
> > Ramalingam <ramalingam.c@intel.com>; Li, Juston <juston.li@intel.com>;
> > Shankar, Uma <uma.shankar@intel.com>; Gupta, Anshuman
> > <anshuman.gupta@intel.com>; Winkler, Tomas <tomas.winkler@intel.com>
> > Subject: [PATCH v3 10/16] misc/mei/hdcp: Fix AUTH_STREAM_REQ cmd
> > buffer len
> >
> > Fix the size of WIRED_REPEATER_AUTH_STREAM_REQ cmd buffer size.
> > It is based upon the actual number of MST streams and size of
> > wired_cmd_repeater_auth_stream_req_in.
> > Excluding the size of hdcp_cmd_header.
> >
> > v2:
> > hdcp_cmd_header size annotation nitpick. [Tomas]
> 
> Looks Good to me.
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Acked-by: Tomas Winkler <tomas.winkler@intel.com>

> 
> > Cc: Tomas Winkler <tomas.winkler@intel.com>
> > Cc: Ramalingam C <ramalingam.c@intel.com>
> > Acked-by: Tomas Winkler <tomas.winkler@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  drivers/misc/mei/hdcp/mei_hdcp.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/misc/mei/hdcp/mei_hdcp.c
> > b/drivers/misc/mei/hdcp/mei_hdcp.c
> > index 9ae9669e46ea..3506a3534294 100644
> > --- a/drivers/misc/mei/hdcp/mei_hdcp.c
> > +++ b/drivers/misc/mei/hdcp/mei_hdcp.c
> > @@ -569,8 +569,7 @@ static int mei_hdcp_verify_mprime(struct device
> *dev,
> >  	verify_mprime_in->header.api_version = HDCP_API_VERSION;
> >  	verify_mprime_in->header.command_id =
> > WIRED_REPEATER_AUTH_STREAM_REQ;
> >  	verify_mprime_in->header.status = ME_HDCP_STATUS_SUCCESS;
> > -	verify_mprime_in->header.buffer_len =
> > -
> > 	WIRED_CMD_BUF_LEN_REPEATER_AUTH_STREAM_REQ_MIN_IN;
> > +	verify_mprime_in->header.buffer_len = cmd_size  -
> > +sizeof(verify_mprime_in->header);
> >
> >  	verify_mprime_in->port.integrated_port_type = data->port_type;
> >  	verify_mprime_in->port.physical_port = (u8)data->fw_ddi;
> > --
> > 2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
