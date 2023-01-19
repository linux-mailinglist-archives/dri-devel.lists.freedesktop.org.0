Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 792C36742CF
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 20:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C887310E9D3;
	Thu, 19 Jan 2023 19:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B4FF10E9D3;
 Thu, 19 Jan 2023 19:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674156495; x=1705692495;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2bUFkMRph/ZL5c0w2KjKw5WCI2xJEuIQQKTe6ngZMTo=;
 b=d8mjNNiB/rjU4img8qctNaSlpV0PL8vPiXbOMO3hXs2T6OohepalI6BN
 szU4+pBlNmRtf9MoGMC2hqEq/3hqvQ5v94dvrU7rHm+6Idm7wYxA3pyyY
 eE930g51BJmbEoKYUIiWeSHP0yM8CwYi1w4QjKj1X0uPhDVvFkF71TyFx
 MzSRJepDpI/y3qLGMoDmu6DfJe9PAlH5TIKYovCeuyB7Q6v6fWiU6zbgV
 bh+wEVMLF328H9R/OP2mvwNCUouw+pX8WWFNPAxNrioUDoKkeKFp90IH+
 SZIqbkkpbv0zvQzNU9s2p8mkbjcENsoMP510/NSO/8NmWtl93xUtHMxts Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="326675906"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="326675906"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 11:28:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="784181873"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="784181873"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga004.jf.intel.com with ESMTP; 19 Jan 2023 11:28:14 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 11:28:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 11:28:13 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 11:28:13 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 11:28:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjuJD9bgLKyxQ8RWAg6x6CFqin1E0IH0aDR9nWJRtUWk1QtKTBf//OxYn4bFRL8PgTA5zocPilS3UkUHDK6S/jt6CI1p7eqj1vBDibFfwLShAInIxDDeuJzYDVSCfErUim3yghvXI/jFoc7Hkfa3OxHpxwzCT4ECrJ+8SMcPNIjGO5rtfzBytprpbHd0DN7UrsOevs89iwgeVzY2bvPnEOeIUL+4ned0HkaPFJX1P/wl/L+eoaYUDgWCbLkaEGA7niTOqjd2EgMEaQcWXpGdZhxF0G764Hsbrvdz4PR5v6K4KqOGAGN/dtEUbnBo5ROK5wd4zuCL9ot46tDpX4jSVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwDeXZ8wGHd/0NzQAwXIId06ZiGYn/lXyCjg8cvpaRI=;
 b=QNppYOdfulEWRMqaNYzV/holiu5dVvP43TimZNl+Q7/xomPh4Evelz4Mt17rlMBbVPWFuw/2WTmpiD8UM4wDj1M+PEf+gDy1bD/MIp85YVj7SfqHaDB6Hnt93bmDzA+9W7MO29nOHbCaN+nQWag3whTmA+1UJOg9COLIpOyh4hS+hAJTmx9a7R8G1aiuHHpAETGAadJiT02sFE8gTVhezjfJlsFCSX/o2cGdUIHDOjsnBXEsKl6iM5kAbMn0MFkWPXPWks+f35zKfpehHkEnkbI1WJDHVsCAix06MKQ7BHmIW7JF0GCtTna5bqLaMxmcsPlo6ZJZkNJSVUNgsDrW9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB8176.namprd11.prod.outlook.com (2603:10b6:208:452::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 19:28:11 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 19:28:11 +0000
Date: Thu, 19 Jan 2023 14:28:06 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 4/6] drm/i915/pxp: Invalidate all PXP fw
 sessions during teardown
Message-ID: <Y8mZxg0FvcGWy9RV@intel.com>
References: <20230113011850.1463965-1-alan.previn.teres.alexis@intel.com>
 <20230113011850.1463965-5-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230113011850.1463965-5-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: BY3PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:a03:254::8) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: d1baffb5-816e-47c2-5140-08dafa534ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uYy0OKsfHaVw+JVYtp1ltDKHYiFFVGrSX3Dm89Z+nbeF/IP2oHfHiu2aZPI15UYCy76yv8wXp/QuwWxAe9UcEkjXG9O0TMfesG1pXDHoXc2/OCpNQxaxsLK9jIuZh38OWmEVLL+yBZ2VUO8Le+JffoE+5ltYJhwZ3qY14cGACqVDYphpz32sd8488JCRxMI8RtUoIiCNo7Cy6uY0koHj2/l0dgmRGF4HG8LGq7nSwlRqk8ampw4OE8y9CNrvbu/gk+miaP4Us8NOq79JxJwrmhHNBkzjPxtbrB9gc9xZTmbKZlA053rNXzLimo1xYUJbktxjozfYZucDtfvkzD95+KRaXRl+jorm2ETofKIltUschv2VIsV/7sAD2LRyp5rZp2XQloNuRumpu/FsfduiHb7oS3wS6Yb+bI/cltVW7o6avzu6SSJdN80SHm0D5TNlE+4udp798JRZJWMmbK4KbvteJojU9UYYyl0jFUh09XBmdBdigiO6w8UnYRr3zU9kJD/yEjl6Rb3TMZCagWWeG3Y+nWOm7xU/s3lmjFpbBa25xRr6MZ962Xy0rp4sUK/0fRuGOFAuFwlvk6xGJUZoVH8Hgih4ld9Un0mhlvIsS9kFWTRdEMPSVTTN1gdAk0uEfNpC5FRe5cbzNwG5jhmCMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199015)(82960400001)(38100700002)(66556008)(66476007)(66946007)(44832011)(2906002)(6862004)(8936002)(5660300002)(478600001)(6506007)(8676002)(4326008)(41300700001)(2616005)(26005)(54906003)(186003)(6512007)(83380400001)(316002)(6666004)(37006003)(107886003)(6636002)(36756003)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9wWpL/mcJVpDO9v/houFrIqjXZWp2f0QyCObuFOz25o6/4MqLHnI/Q6IEWFQ?=
 =?us-ascii?Q?zuPDgC2cyeSgTHkWkO/DPthVd9Z/kXMZoS6o0dWZB3K3Kvo4suSiAGSaiAiR?=
 =?us-ascii?Q?G1vz8EQ+N+C7l2zFetgjmDTexyjGko1saLs8Ta2GIJTcc+Q8TPMxdo0XC3hE?=
 =?us-ascii?Q?jRk63b/lD7oC3ESZgYELiDHDEiIdaAI727CU7q1DxgnVDjK0Ie8sKV3SR6sc?=
 =?us-ascii?Q?bJ+xbh4Rdqmr3Ow1nsI0ydpvSfjGuxGaos9QkPFq/200Gu0Uc4GTPsKaWoxw?=
 =?us-ascii?Q?9/dkBEXuXyZop3xVQp96fhD2j9QgSKYtBNIEO/cyDlzqZOdGdBY0br8QHvi0?=
 =?us-ascii?Q?Hag8NM5sr9tF89eo/eTGPKKo6E32hImlCV0f3HvGH+fPrBXqWb9ifAm5NG3s?=
 =?us-ascii?Q?d8WLtwg04QaXZ2NL3BKN2VC4reGyz3WgPzw26yyaqrLB7apwcHljktBe4VE0?=
 =?us-ascii?Q?ImvWdqT+SmHrNZoipMyoDifPBEVksIBbe8Nl9P1bWL1gjbdLGxnYjgC3gQK2?=
 =?us-ascii?Q?ccVPJbhHHHCeKrkvuMMn3j3yOI/BfYZ5m9yE/l0cdFY5dxb8X7741swLiNr/?=
 =?us-ascii?Q?L+zXv+x+6eSCjoEI7CcAL2cIFfHtIfSzUyYxlXd+m7vm6qPxu3D6yjVQUqr0?=
 =?us-ascii?Q?4JMI/BuiwBGXE1OW6IB3kVcXuiHu09VhaOdFgRaPq2svvvZXrS3LV6OxckNl?=
 =?us-ascii?Q?nhbWPCmJfY2yfeeynLqftXb4R61ATjBHn3e/NWHZBIpoAX69DaO9fdp5ePkG?=
 =?us-ascii?Q?uH+bhbwYn6hP/tC9u/e3kKxSBONWYaxm3BMxJFyZ4cICR6wVI3qjeWFuT+Jw?=
 =?us-ascii?Q?hF1i0+E2zXd6Xqn8f0meuwPFnzGgCz9SFwtctYnFoKLV/eVkeiuk2MgLCtI2?=
 =?us-ascii?Q?t68ifRWdlnZr0nS5f+UiQDgUplfFHkLRmNdrPdGKZNeA4J3gkPz16W/+Mau1?=
 =?us-ascii?Q?2l8Bs1JAEaw/IlTKt43xFBcZeXswuKdx9mUtiXmjZPOLd1J0xhaXcoEzicv0?=
 =?us-ascii?Q?qYx68GqGLoWZitR79SJAAHOF/u9GXRer+8UEjbI0FhXYYfSQAyCCViCkZuQN?=
 =?us-ascii?Q?Yxbqj5GP8/Cdxb9QC+GH7Apx4Ss6D5xgDvtj4YMGIqTAe/X4bA1fUeDH6TN6?=
 =?us-ascii?Q?mFMWmQgOuNZ6BiVQwTGlHrF+MK+UFO2yA9AVEhjXPqM60W1FntA5JmoA4FRV?=
 =?us-ascii?Q?ocB/3twQzaS6fahH1xXGzwh3YcybU0+NUcQsXD1cIeuuaVOFRhS3WiD0CUUI?=
 =?us-ascii?Q?U4jPQ3Qmv/Wlo218vRIrvGeVvm5HwxTgLqtayHV46xjEytxg4kkQ+EmlvWOk?=
 =?us-ascii?Q?AiHPtWftRmhZSjKxS4Eh5G6nzR2FkaaqwBgdPVzeLYz+rvDrANkBfpLmAyPU?=
 =?us-ascii?Q?hPZeLN/VEQ3RKe7vefBe2OjR1Rdo9u8HLt3n5b3xIGKngZbSgu2MoUURqYb6?=
 =?us-ascii?Q?fogFK1QzzDG082UPc/ohhwLxCHzPx4RCpqNjeeE1xhbhtZEmpSNm9G/bUD8J?=
 =?us-ascii?Q?hRN722paK7Yb3C/nz7QAhR38zw088IK60hQO15wnyAKCwZAnLIQHpNaFk0aK?=
 =?us-ascii?Q?LwsnnFS7CkiUPPF4lguaInchPh4Zkkb2Jpfj5en7+Wgvamfwx2VALM8vjn2s?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1baffb5-816e-47c2-5140-08dafa534ce4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 19:28:10.9981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WaQ8R6YjTcm/msX8o6+l/vSxvjj0A0Hv242DkhkjIjd9sJIxvG32Dj1fcZaHyk/m5mA/e7pHCBo9CByBJStsRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8176
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
Cc: Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, intel-gfx@lists.freedesktop.org,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 dri-devel@lists.freedesktop.org, Tomas
 Winkler <tomas.winkler@intel.com>, Vivi@freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 12, 2023 at 05:18:48PM -0800, Alan Previn wrote:
> A gap was recently discovered where if an application did not
> invalidate all of the stream keys (intentionally or not), and the
> driver did a full PXP global teardown on the GT subsystem, we
> find that future session creation would fail on the security
> firmware's side of the equation. i915 is the entity that needs
> ensure the sessions' state across both iGT and security firmware
> are at a known clean point when performing a full global teardown.
> 
> Architecturally speaking, i915 should inspect all active sessions
> and submit the invalidate-stream-key PXP command to the security
> firmware for each of them. However, for the upstream i915 driver
> we only support the arbitration session that can be created
> so that will be the only session we will cleanup.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> Reviewed-by: Juston Li <justonli@chromium.org>

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/i915/pxp/intel_pxp.h          |  1 +
>  .../drm/i915/pxp/intel_pxp_cmd_interface_42.h | 15 ++++++++
>  .../i915/pxp/intel_pxp_cmd_interface_cmn.h    |  3 ++
>  drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |  2 ++
>  drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      | 35 +++++++++++++++++++
>  5 files changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> index 04440fada711..9658d3005222 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
> @@ -24,6 +24,7 @@ void intel_pxp_init_hw(struct intel_pxp *pxp);
>  void intel_pxp_fini_hw(struct intel_pxp *pxp);
>  
>  void intel_pxp_mark_termination_in_progress(struct intel_pxp *pxp);
> +void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32 arb_session_id);
>  
>  int intel_pxp_start(struct intel_pxp *pxp);
>  
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_42.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_42.h
> index 739f9072fa5f..26f7d9f01bf3 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_42.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_42.h
> @@ -12,6 +12,9 @@
>  /* PXP-Opcode for Init Session */
>  #define PXP42_CMDID_INIT_SESSION 0x1e
>  
> +/* PXP-Opcode for Invalidate Stream Key */
> +#define PXP42_CMDID_INVALIDATE_STREAM_KEY 0x00000007
> +
>  /* PXP-Input-Packet: Init Session (Arb-Session) */
>  struct pxp42_create_arb_in {
>  	struct pxp_cmd_header header;
> @@ -25,4 +28,16 @@ struct pxp42_create_arb_out {
>  	struct pxp_cmd_header header;
>  } __packed;
>  
> +/* PXP-Input-Packet: Invalidate Stream Key */
> +struct pxp42_inv_stream_key_in {
> +	struct pxp_cmd_header header;
> +	u32 rsvd[3];
> +} __packed;
> +
> +/* PXP-Output-Packet: Invalidate Stream Key */
> +struct pxp42_inv_stream_key_out {
> +	struct pxp_cmd_header header;
> +	u32 rsvd;
> +} __packed;
> +
>  #endif /* __INTEL_PXP_FW_INTERFACE_42_H__ */
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
> index c2f23394f9b8..69e34ec49e78 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_cmn.h
> @@ -27,6 +27,9 @@ struct pxp_cmd_header {
>  	union {
>  		u32 status; /* out */
>  		u32 stream_id; /* in */
> +#define PXP_CMDHDR_EXTDATA_SESSION_VALID GENMASK(0, 0)
> +#define PXP_CMDHDR_EXTDATA_APP_TYPE GENMASK(1, 1)
> +#define PXP_CMDHDR_EXTDATA_SESSION_ID GENMASK(17, 2)
>  	};
>  	/* Length of the message (excluding the header) */
>  	u32 buffer_len;
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> index ae413580b81a..74ed7e16e481 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
> @@ -110,6 +110,8 @@ static int pxp_terminate_arb_session_and_global(struct intel_pxp *pxp)
>  
>  	intel_uncore_write(gt->uncore, PXP_GLOBAL_TERMINATE, 1);
>  
> +	intel_pxp_tee_end_arb_fw_session(pxp, ARB_SESSION);
> +
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> index bef6d7f8ac55..9e247f38f3bd 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
> @@ -311,3 +311,38 @@ int intel_pxp_tee_cmd_create_arb_session(struct intel_pxp *pxp,
>  
>  	return ret;
>  }
> +
> +void intel_pxp_tee_end_arb_fw_session(struct intel_pxp *pxp, u32 session_id)
> +{
> +	struct drm_i915_private *i915 = pxp->ctrl_gt->i915;
> +	struct pxp42_inv_stream_key_in msg_in = {0};
> +	struct pxp42_inv_stream_key_out msg_out = {0};
> +	int ret, trials = 0;
> +
> +try_again:
> +	memset(&msg_in, 0, sizeof(msg_in));
> +	memset(&msg_out, 0, sizeof(msg_out));
> +	msg_in.header.api_version = PXP_APIVER(4, 2);
> +	msg_in.header.command_id = PXP42_CMDID_INVALIDATE_STREAM_KEY;
> +	msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
> +
> +	msg_in.header.stream_id = FIELD_PREP(PXP_CMDHDR_EXTDATA_SESSION_VALID, 1);
> +	msg_in.header.stream_id |= FIELD_PREP(PXP_CMDHDR_EXTDATA_APP_TYPE, 0);
> +	msg_in.header.stream_id |= FIELD_PREP(PXP_CMDHDR_EXTDATA_SESSION_ID, session_id);
> +
> +	ret = intel_pxp_tee_io_message(pxp,
> +				       &msg_in, sizeof(msg_in),
> +				       &msg_out, sizeof(msg_out),
> +				       NULL);
> +
> +	/* Cleanup coherency between GT and Firmware is critical, so try again if it fails */
> +	if ((ret || msg_out.header.status != 0x0) && ++trials < 3)
> +		goto try_again;
> +
> +	if (ret)
> +		drm_err(&i915->drm, "Failed to send tee msg for inv-stream-key-%d, ret=[%d]\n",
> +			session_id, ret);
> +	else if (msg_out.header.status != 0x0)
> +		drm_warn(&i915->drm, "PXP firmware failed inv-stream-key-%d with status 0x%08x\n",
> +			 session_id, msg_out.header.status);
> +}
> -- 
> 2.39.0
> 
