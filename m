Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C5129E607
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 09:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2526E8A1;
	Thu, 29 Oct 2020 08:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0014ca01.pphosted.com (mx0a-0014ca01.pphosted.com
 [208.84.65.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81D346E542
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Oct 2020 14:40:28 +0000 (UTC)
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09SEW1KV024650; Wed, 28 Oct 2020 07:40:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=8E11/jByS4yPaFs10yjGH154GgVErWUaIm6GCW3g6TI=;
 b=ZzFM3W6NkpKy8vuLLs7kQODa/+LvTxagaqZdSQHSu9wGGON21WP1tGWOg/dgtZ5/yUcW
 iQPwAOxUkGi1hlHjhxjnwQxSB88nlg2mVe/DigDbJraeUt2qgaztb//kSGSpdThwFP5S
 y9Z90pNJSRA+l6JPlOJ5LcTSqN7ydrIZCEovPzrG4Smxma+1eHKoY4XB28rN94IkIkMG
 SoBv372bNBZ1ukNv1MihXHxHPnJLv0oLTRn/zPcVjwaGSe83tkG6inLLVykaEPRadwbE
 EGWzGWo8Ta4Un95IL7IcR17kBLcst2JgG06pJ9AmZXB3ZUcC/2nDIb5Zfzcpgmj2rG73 9A== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by mx0a-0014ca01.pphosted.com with ESMTP id 34cgtw09jn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 07:40:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BnLNs1iypfEcSgVIVe05R7Q60iqPBxpxxrdc4Chje8gNAXrkDL4FPeRfpm2DY4VZNMndg2ANFbH0uIdrTVPHoYcYw7lwR6r/zNR3FzLCCnlgSPz/4oGFjN65mDEeIWfzdjWwMkTT8gF3/5UBhLW51FlczxeQtvvRJFs9+zrA/eJYGy+KPZFM+l4EwLCjzih+UEOiHU+B9DsB+v8r/dVnN23k9GFYIHNVuVKkdJ+0ccKajRoryAsD8J7VACKdP5b87Hu0itO9Yw1damhTC0RDgswjqU6fliQEcAEhaH5z/Lt6qJf+wri2RkBTZ8Hvk1tWViCNrSwmf8hnvl/5kxxM8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8E11/jByS4yPaFs10yjGH154GgVErWUaIm6GCW3g6TI=;
 b=RKOgSAR3Zwlscm48yitaJKLJM+ha6A2CucQTnQ7SVckX2XN0xJleQO9SrugnqvMp+hwT5bw3MDZwuVVWo5L5VVH0qVHb5xG7IEff/83QQiD+GRIIdBjUOsjY4rjyGF7dntqiirXDWHS+w0JlrT9ZGT68oBVdTZdG5WsP6Q1ma3ap0LkcMXw2577S1xB2RUFH3ua7f9rFt66iL1R6uP+9I5Va9i4620y+UKuxncGDWAbO4MZgB851OegiMwRijwuoE67MHlVzK/kXwgejnoGn2agxHTGHAoZGq0/BGfXrRazofIrdLxepspYsQIz2QL7YiEs7IVS888IiBGIPvCyTIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8E11/jByS4yPaFs10yjGH154GgVErWUaIm6GCW3g6TI=;
 b=09B7iGU9aJ/c6uCDAufUAQhobLE1kyH31D4Q9iC6pIUtnsY2r7OJUmmHByobaBLNJJ4bSumzGSxoX+o2OGw3RgOjoCi25ARMvtX1CaBaw484XkxVzQYj8nVc/dOuw2P50jQ+9e1REyDOhKDAUyzLUCIs9pVC7W4OVUORShdQFck=
Received: from DM6PR07MB6154.namprd07.prod.outlook.com (2603:10b6:5:17e::20)
 by DM6PR07MB4987.namprd07.prod.outlook.com (2603:10b6:5:2c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 14:40:20 +0000
Received: from DM6PR07MB6154.namprd07.prod.outlook.com
 ([fe80::34a3:dbd1:11d6:c303]) by DM6PR07MB6154.namprd07.prod.outlook.com
 ([fe80::34a3:dbd1:11d6:c303%7]) with mapi id 15.20.3477.029; Wed, 28 Oct 2020
 14:40:20 +0000
From: Swapnil Kashinath Jakhade <sjakhade@cadence.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: RE: [PATCH 5/5] drm/bridge: mhdp8564: Support format negotiation
Thread-Topic: [PATCH 5/5] drm/bridge: mhdp8564: Support format negotiation
Thread-Index: AQHWo6irhfJYmuIEHUyIi94oVWKAPamtJ2Yw
Date: Wed, 28 Oct 2020 14:40:19 +0000
Message-ID: <DM6PR07MB61543ACAFA176B207BC332B5C5170@DM6PR07MB6154.namprd07.prod.outlook.com>
References: <20201016103917.26838-1-nikhil.nd@ti.com>
 <20201016103917.26838-6-nikhil.nd@ti.com>
In-Reply-To: <20201016103917.26838-6-nikhil.nd@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc2pha2hhZGVcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy03ZDFmZDc1NC0xOTJiLTExZWItODUzNS1jOGY3NTA0NDIyZDhcYW1lLXRlc3RcN2QxZmQ3NTYtMTkyYi0xMWViLTg1MzUtYzhmNzUwNDQyMmQ4Ym9keS50eHQiIHN6PSIyOTQ4IiB0PSIxMzI0ODM2OTYxNDg1NTg3MjQiIGg9IkdreldXb3dMd0RyMUlSZlR6cmNZNEcrYXg4VT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [59.145.174.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c048030f-b189-4081-d008-08d87b4f6501
x-ms-traffictypediagnostic: DM6PR07MB4987:
x-microsoft-antispam-prvs: <DM6PR07MB49876AFC043D1A8E6D5A54D8C5170@DM6PR07MB4987.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bo/BSQh36vG64BiVGBP/4dHM1t0N8qMpZVn5HAi2dIqOYYZtyRBfa5Qe1N+hXVjQA31g2suPcln8SK9A6lNzRYDa/mV5K5gsiuQlIlQl32zlzAchB0cEx7EWPEIny3G5Jtxk9+zFYL/YeBRKus7kGOnvSzPlUI79NYggFmbB+0oTzXtZRDtk3qJmeDrl3MehpT2i07RuUl/NM920M95MI9VUOB7Jlp9hmhx5DskoC0cSdza+DtGIE63WjWJ/ml8sGt9zdfeW7m+Kfa1KJe3tdGCGgPBE8yYq4CnrFbsoHHFe7fCDSBrNMcvCNtvUIRAIwDTX886Wk0H3iWcXNWZiAbHIy5gJl6DcKI2G5lwc39Npc11KoKrVeLKzVXHEq5iu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR07MB6154.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(36092001)(33656002)(7696005)(54906003)(8936002)(8676002)(110136005)(71200400001)(478600001)(52536014)(86362001)(2906002)(5660300002)(9686003)(76116006)(66446008)(64756008)(66476007)(66946007)(66556008)(26005)(83380400001)(4326008)(55016002)(186003)(316002)(53546011)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: HhSyVpR72xkkZMjvbZTH7HVH6FVJKyw+pYSu1/PrTgBFVPZ8/sOBHdWtHkGCDaOnXmKo8vdHH0fkhgoNDvcj4YyB2v7tqAHLLr3ZFPhiDLb1onosyHpz1WGq4blskN/z/VmKw6OxmKU3s3JtoDZVbkGFyWfjg5N3SzgbJBcgkwjZ85pQTm90eOJcSDDE9dFGz8rGkA3DAQYklz6vklPg7EsrcxZdHapOjByqnoolOY2trwf+vBRuOF8Xric24vM/KbKVAA1nWIvqM0XQWxkdPIusqeGVkm8tTpPhD9k3cRPZI21BlEKvZcR2+iE2qM3rg7ugggJJLfzk9d7zV693QY+uZria1gdOKQEDoGT6lVcw12yH6/9YjAue4/nAZPbrGVNHT6r//T2ucbPniSROUtUgSy3o+f83XOrRBdoWA+D6BD4a1eAOMkMZRwEYDihPUrJ9INuGvJFDxj7jBEMp1wd2/XPgCDS6PUcIwA8rNFD8FtaDdWb/pjdO4ZAVKgiSthdKkzGCdsfoiZOx1OgUL5K7hkNVX3JuebPvI3+BO8d4sM4hQ48PVBwLdLA80QUniGeBrCxR6qVJpHDMG+a7ktiNVIogH1aHm1javMbAWWaPMh/oAxIt09BpbEMEmqTlI3mIsGU1mFFUSrmNE44G8A==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB6154.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c048030f-b189-4081-d008-08d87b4f6501
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 14:40:19.8886 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3giD1KdgZKcWjNbvl13Z52h1znUPdRxeSwk+0qxTZqu8fAwlMLj4oefASIgQ7UBLYbIC12EMhz3sOQPVGrzcKdu4HQYOL6PNJmMTyYlPQDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB4987
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_07:2020-10-28,
 2020-10-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1011 priorityscore=1501 mlxlogscore=999
 suspectscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010280100
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:12:48 +0000
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
Cc: Sekhar Nori <nsekhar@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> -----Original Message-----
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> Sent: Friday, October 16, 2020 4:09 PM
> To: dri-devel@lists.freedesktop.org; Tomi Valkeinen
> <tomi.valkeinen@ti.com>
> Cc: Sekhar Nori <nsekhar@ti.com>; Laurent Pinchart
> <laurent.pinchart@ideasonboard.com>; Swapnil Kashinath Jakhade
> <sjakhade@cadence.com>
> Subject: [PATCH 5/5] drm/bridge: mhdp8564: Support format negotiation
> 

s/mhdp8564/mhdp8546

> EXTERNAL MAIL
> 
> 
> With new connector model, mhdp bridge will not create the connector and
> SoC driver will rely on format negotiation to setup the encoder format.
> 
> Support format negotiations hooks in the drm_bridge_funcs.
> Support a single format for input.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index d0c65610ebb5..230f6e28f82f 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -2078,6 +2078,34 @@ cdns_mhdp_bridge_atomic_reset(struct
> drm_bridge *bridge)
>  	return &cdns_mhdp_state->base;
>  }
> 
> +static u32 *cdns_mhdp_get_input_bus_fmts(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *bridge_state,
> +				      struct drm_crtc_state *crtc_state,
> +				      struct drm_connector_state *conn_state,
> +				      u32 output_fmt,
> +				      unsigned int *num_input_fmts) {
> +	u32 *input_fmts;
> +	u32 default_bus_format = MEDIA_BUS_FMT_RGB121212_1X36;
> +
> +	*num_input_fmts = 0;
> +
> +	/*
> +	 * This bridge does not support media_bus_format conversion
> +	 * Propagate only if supported
> +	 */
> +	if (output_fmt != default_bus_format && output_fmt !=
> MEDIA_BUS_FMT_FIXED)
> +		return NULL;
> +
> +	input_fmts = kzalloc(sizeof(*input_fmts), GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	*num_input_fmts = 1;
> +	input_fmts[0] = default_bus_format;
> +	return input_fmts;
> +}
> +
>  static int cdns_mhdp_atomic_check(struct drm_bridge *bridge,
>  				  struct drm_bridge_state *bridge_state,
>  				  struct drm_crtc_state *crtc_state, @@ -
> 2142,6 +2170,7 @@ static const struct drm_bridge_funcs
> cdns_mhdp_bridge_funcs = {
>  	.atomic_duplicate_state =
> cdns_mhdp_bridge_atomic_duplicate_state,
>  	.atomic_destroy_state = cdns_mhdp_bridge_atomic_destroy_state,
>  	.atomic_reset = cdns_mhdp_bridge_atomic_reset,
> +	.atomic_get_input_bus_fmts = cdns_mhdp_get_input_bus_fmts,
>  	.detect = cdns_mhdp_bridge_detect,
>  	.get_edid = cdns_mhdp_bridge_get_edid,
>  	.hpd_enable = cdns_mhdp_bridge_hpd_enable,
> --
> 2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
