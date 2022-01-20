Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC0E494E33
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 13:48:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE8710E418;
	Thu, 20 Jan 2022 12:48:55 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EFE610E418;
 Thu, 20 Jan 2022 12:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642682934; x=1674218934;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version:content-transfer-encoding;
 bh=atzDPJqrngSOM04VFPXWdjvHP/aHPnXhscZkFS8+dlw=;
 b=Um0oXlMtmTpSvb3b0+zS00plSuQK/N0D5hoHTGBYUkUEvEdEs8lUiX6F
 90zaUyTuk+WhN8Q8V/lNyMv97d+tPG4OUFzeo9+SMsR1XeqI9ew+BHOMG
 Ul2JRv6otwSmLHmq0sZu76194EB0s7IiyqtZegKT6MDXfu8lr1J8Y3PTy
 rDtJX5pxYRlxQDvYMq7aAadkXMQE/s5PJo+/pePV44znvwfnWv1jEKBFK
 Nv+ITGZDrNtYgNv4ploBl0305ZzUpSonmdsD8lr2bD+nUO/0G2bkF1+ks
 Y6qN1fW6l5SmN65xNSMPwBeg8hFGDQxzsZeiwhwfIsxtdhCkY2PDME2O/ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="244163945"
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="244163945"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 04:48:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="694190559"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga005.jf.intel.com with ESMTP; 20 Jan 2022 04:48:53 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 20 Jan 2022 04:48:53 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 20 Jan 2022 04:48:52 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 20 Jan 2022 04:48:52 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 20 Jan 2022 04:48:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWx54da5Qk9xhE/2NK0d9n+PVVzdFHWWncJbEuvRkTrF8YrRVdMXjmMZQo5OrvtbZ6MZM0CmpCR+5tEdTsQjG9CYRGA9T+8N8NiU8p0iGdm6Ce/wgEq8Gml8vAdC/act2JSa8+uWIZx0nAsoWCqfzf4ZcBwD6pkMAQASg4P5rp2ooCQ0//KR89la85EGliEoytzrR/xZRG5HtEkQjTHfkq2Y/vp5v9CtvrBnLi/n38+U3TEs7Sjomi2RvaSTu0wL21IDmZ+mm6XK5tZAHhJx1BTwp95aksf+tbHFDwsvSOoZ/DLy0nIDZ0881d1WalGEWUne0qdq9G2weLTB32J21g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSBqy4FA4L8addDvWEjznyssFNzXBzqzzONy+oVhZeA=;
 b=kk8iJBrLX02zNd3Zs0HgKPYNqZsvaB4FJ5nk3bHoPA6zo9ARoHoc9KSwZ4ThYbkCjVaoz4e88kUcjnW0UedX8MAYr3XbyPEWPdJLzNcolMs/dYZ8EeN99Vmk9lpaTp7KZ6oeRRIJF+lA6ukguFdXgQwvkm7DZggt3zsG5n6krSenAYdmhZQqoteE3Xs/TjZkF3Roisy3fzxLb0PEpM5TGi+6DI1QkWPo3GKhHXEcUlLWt214+RYJl0VkEgrSZQZs6LfExtEBT+5EKNz/lYbfn4TWygCM/SK0j7UJN4fjwEP3HzZE34aD6LB5KshYf3ZE0Br3o7cbFL0UW72s0aTLeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB4899.namprd11.prod.outlook.com (2603:10b6:303:6e::14)
 by BL0PR11MB3329.namprd11.prod.outlook.com (2603:10b6:208:66::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Thu, 20 Jan
 2022 12:48:50 +0000
Received: from CO1PR11MB4899.namprd11.prod.outlook.com
 ([fe80::5b8:5e9d:fbd6:3c30]) by CO1PR11MB4899.namprd11.prod.outlook.com
 ([fe80::5b8:5e9d:fbd6:3c30%4]) with mapi id 15.20.4909.008; Thu, 20 Jan 2022
 12:48:50 +0000
From: "Cencelewska, Katarzyna" <katarzyna.cencelewska@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
Subject: RE: [PATCH v3 0/2] Add support for querying hw info that UMDs need
Thread-Topic: [PATCH v3 0/2] Add support for querying hw info that UMDs need
Thread-Index: AQHYDXQk7CHMeIg9uEekDfxiJzAkaqxr3PuQ
Date: Thu, 20 Jan 2022 12:48:50 +0000
Message-ID: <CO1PR11MB48996B411D72241BAB3C2A00E95A9@CO1PR11MB4899.namprd11.prod.outlook.com>
References: <20220119203541.2410082-1-John.C.Harrison@Intel.com>
In-Reply-To: <20220119203541.2410082-1-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c42cb050-b732-4d9b-93e1-08d9dc133545
x-ms-traffictypediagnostic: BL0PR11MB3329:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BL0PR11MB33295448A4BCC7C8A5F0FF0EE95A9@BL0PR11MB3329.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HBH1XqSIxAWR38fTDBNFAiDwRZmbtxojX165kOSR6CYWjCm/C+SFgS9PJMrlNTkliD4iXDTlnUGumiFjifNKCDcF8mnNJCROr/MNpKKrsdw5AZrxeiL+F/5LNl5kjtScVW4X6KKOLf2c5IUIgGocmmUmrNGSH1lpLyh8kzi+TmCjoqfLvPAt3ltIE+2Nk1PRA7H5pxmqNXQiUNVUK4CSlroj65tM0Yrq8FmB6T/k6G+jLGwKNAjtUGYc1KKHFwWnCPKGu3yVLU9jlT1wPYdcsko6ArTvMF/fIpgZa3pGNC8E6lcgpbiTUEF69Tz+KwKEk1CnXQ2ncZSgJlNwwHTclJSj706f5xvRRZw6Rd4aljw6KKNT785mrOPVmfQOsHtH+bhygPHGVcB7VAqMOhwp1wXLZVdecWSGlQZXjYUT+iuELs8J8cOVLfPP7/WMmHaAFkau+r3o2RoEllN40XZFSoPABDFt1t+xJH73ITwjxlBFQoRw98TMe/XT4P2/5G9EEGTHQ206jPfj32yLQa08X48NsmKzRs7/l4Q5wFuiRHYMUMMFsFpX7tlWecUyDj2BMaHFnUByrTefRUrMsYH+WOwawe7/7R9n7nMuwUM6uQMRUFjWvHzXM/DOEmkic60EAv4I4xT+rVg0sKZyOQFwquAjUPYACutYEzsfrzdsjb3CI0WMMEpHJdQUiXRivgoy1rJrzqVPROQW5N9UH98aWYReHvM/sGeVBmJkeeq2a6XCZSQ9+TyPpD/9Bf+Uf7eT9ZFtJeuPK3FyrdpzhMNkdFTofUazl0QJ4yDtHx7i8L3XcU65lAv7wsD4e4qHjo/U3u8MiWSGCuYRFQDDV6KWsg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4899.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(52536014)(107886003)(38100700002)(186003)(110136005)(6506007)(966005)(508600001)(450100002)(8936002)(86362001)(316002)(38070700005)(26005)(4326008)(66946007)(7696005)(2906002)(71200400001)(122000001)(66446008)(33656002)(9686003)(66556008)(8676002)(83380400001)(54906003)(82960400001)(55016003)(64756008)(76116006)(53546011)(66476007)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wyXWUOKM6ulnsMkfAjK0dVdsSZYGdE2FHV4S6RD+B/RS1WHQNQS6fQ6d/nEk?=
 =?us-ascii?Q?g0KOi1KxwMn5ScLEX5spxvtg5E1Cqta/iJ44OZsjjdeJKyU2/KT/9u2roewx?=
 =?us-ascii?Q?wtseqWjpDuuNKSv0WjYUN75Sys7RatejLFyTorDSoaLSynmD7W9P4BB5Grb6?=
 =?us-ascii?Q?K6pEyigl4lJ2IIB8+RVQftAkPqnKD7Fnqbe1r6NIKjJu77A7a5TYi670oD6c?=
 =?us-ascii?Q?Vq35ayC+Gpme38kHSNYiVI4LuuvcuhdMwGIjCCj20WvXdRWs2mdgVBCspHdz?=
 =?us-ascii?Q?pA/y9xXjERYzHkugEUdVrszVAQ+shc79sQJl9XOR+Oz+UB00L99rTKvZB6mV?=
 =?us-ascii?Q?PGMyyd0XthXbky8FyxZ0KwNEDcQmgdMvO+K9D7rcfEChloDMwtvaHAETowmy?=
 =?us-ascii?Q?tf5ya9Te5uqAQzSOCzB5UadxgKVZBWO8GeGBg1AHtEZBHjvBIBz6CBLhR9Ii?=
 =?us-ascii?Q?m4G7702yy/wqruITnQl3ooIi8f383S6M/gtZ/eNa2xCHBlOtprzIU8SPdOPP?=
 =?us-ascii?Q?ra6lH+GtenkmT6s8ClM2wBTqj43ePuTVJVUOJvb9gJO6XJ+QK1HSX/0QnyIG?=
 =?us-ascii?Q?L71M8nCXJGz1nXTNPj4pRouQI4nlEOPL865QXp961LwbKwZsbsPmu+PfJVIJ?=
 =?us-ascii?Q?EtW7ck7XAfh50ET4kIUqBH1vQ1YQvIt8KYn4N/5br4Yn1odkcAipAena5nyV?=
 =?us-ascii?Q?vATQwo4Vnxc6BDpcu2qUODPQ5Lx92LKPryRPCbuBpQ/rjg+2LMfeIp3n96TK?=
 =?us-ascii?Q?9VBDq+eBqhMfaVTvspntyRs7qG3jo5UpL2jQuZ0mEr8xPGiZfvgkj9mqQzie?=
 =?us-ascii?Q?XsS4roBV4c5ELC7E2TA4sDt/vrqq4MF+RCqLJnPZJnnn7UQhNPVpm0PGe2w2?=
 =?us-ascii?Q?BEpDXVjYzClFiTNB/uJAZNd2dNhZymBmUaPtjo/hCc9GRbAcFQzGB5SAdQFn?=
 =?us-ascii?Q?7RcTLFO77dbyYkTMk1Pp+4PW0sVtoF6OAqDvCE3S5Umf+He6q2ah95NGJFQs?=
 =?us-ascii?Q?LsFEYCx+LcrZFi2SJCtg2A8GYHV/4gn1yM8UZo8JyzhKaoMTh0Z6NK/f/5/t?=
 =?us-ascii?Q?4Xhvn7yCzx5vyz+RnN3vL+CTUFV7CkDsc0CabKVzVDWVK78qb9y6Rch4upb2?=
 =?us-ascii?Q?QgjRyVcFoA6CjdAhxBoUXt9Px5HrrNAJm2CnEYSo7dmS8IeL5DeoVmH4y2wi?=
 =?us-ascii?Q?zyPHHdTfpnUbvuRUyQsG1HLVzrgWoCMiCKYk0wP5hiIBg6Z1OSlvkFlT3KYG?=
 =?us-ascii?Q?JKRoYISJInAeaKzInggfW4Is5xFfWpCZrhNxpdzgD7sjbjbQvUpBEwI1v7yO?=
 =?us-ascii?Q?WaXlUl2+s10tAuYDeJdMCCUX1IIWbGvjWeOxayqbD+teL9ShU/Sp4oEzNfGE?=
 =?us-ascii?Q?GUnLPeuTtE4SbCFZpodVkdyri6ZlIPc1qxRYFnCaRWnhnJKNvR54fRS6iZOf?=
 =?us-ascii?Q?EC9HcgV2nKFo8tlJULy5q5fP4btmgzeWY8pj5lP5XtMSGiYt719QsHydWkRQ?=
 =?us-ascii?Q?zxNkTM0CUFi1keqlNxZogmzYKoicfQehoSC//9uObCRyWGw/nn5c3HOQMUKp?=
 =?us-ascii?Q?qGOfrPD1MEt0rYAwvu9C8GcbGTfuFPaC9qm+W/6/s3fhKtAeH1To+UwoFEIv?=
 =?us-ascii?Q?hJBiRUagbyl7mXFN/W77d9jzil+QYunt7DSiuiX4CwFL4lsqmxpAps+qq7Oq?=
 =?us-ascii?Q?I2qnuA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c42cb050-b732-4d9b-93e1-08d9dc133545
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2022 12:48:50.4156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BTUAnlsMbDNPBIb+uWAKQ+8gUMjImcY4bVY+q8FiILOQ2assNDlHSyXVNPF3Nzk6DMEvwLEhPbNNkphmBPv+LNcUGK+/uFk0AevXXD+bvZg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3329
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: quoted-printable
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
Cc: "Ye, Tony" <tony.ye@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Morek, Szymon" <szymon.morek@intel.com>,
 "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>,
 Jason Ekstrand <jason.ekstrand@intel.com>, "Dunajski,
 Bartosz" <bartosz.dunajski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

++

-----Original Message-----
From: Harrison, John C <john.c.harrison@intel.com> =

Sent: Wednesday, January 19, 2022 9:36 PM
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org; Harrison, John C <john.c.harrison@inte=
l.com>; Cencelewska, Katarzyna <katarzyna.cencelewska@intel.com>; Ye, Tony =
<tony.ye@intel.com>; Jason Ekstrand <jason.ekstrand@intel.com>; Brost, Matt=
hew <matthew.brost@intel.com>
Subject: [PATCH v3 0/2] Add support for querying hw info that UMDs need

From: John Harrison <John.C.Harrison@Intel.com>

Various UMDs require hardware configuration information about the current p=
latform. A bunch of static information is available in a fixed table that c=
an be retrieved from the GuC.

v2: Rebased to newer baseline and added a kerneldoc comment.
v3: Rebased to newer baseline and newer GuC interface.

Test-with: 20220119200137.2364940-2-John.C.Harrison@Intel.com
UMD: https://github.com/intel/compute-runtime/pull/432/files
UMD: https://github.com/intel/media-driver/pull/1239/files

CC: Katarzyna Cencelewska <katarzyna.cencelewska@intel.com>
CC: Tony Ye <tony.ye@intel.com>
CC: Jason Ekstrand <jason.ekstrand@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>


John Harrison (1):
  drm/i915/guc: Add fetch of hwconfig table

Rodrigo Vivi (1):
  drm/i915/uapi: Add query for hwconfig table

 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   1 +
 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |   4 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   3 +
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   | 151 ++++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.h   |  19 +++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   6 +
 drivers/gpu/drm/i915/i915_query.c             |  23 +++
 include/uapi/drm/i915_drm.h                   |   1 +
 9 files changed, 209 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.h

--
2.25.1

---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydz=
ial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-31=
6 | Kapital zakladowy 200.000 PLN.
Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata=
 i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wi=
adomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiek=
olwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the s=
ole use of the intended recipient(s). If you are not the intended recipient=
, please contact the sender and delete all copies; any review or distributi=
on by others is strictly prohibited.

