Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3F27CFFF6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 18:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 520C110E52F;
	Thu, 19 Oct 2023 16:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C068510E52F;
 Thu, 19 Oct 2023 16:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697734300; x=1729270300;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=HZHqBGH1anJBQOFNs7oRrJsMyXn1SgsYXtmXnG/FlGw=;
 b=RoeYzqfay2wFbbSOWwECccNMH5Lz2FLcWwVzG64EM32aUIHGUXW1Y0cO
 wKqydZDkRS39Q3I0FGzJw7cGxgbaMeFPZN1ksN6+4LyN6JQcmTKYq03Dr
 kKyuLZ7xLK1WmX6ZVDcHAcduhDc5l/YsIHHmcIu03hcJSaUYD7APqAMph
 zWOn4oaO3sKoSiKgCMA/XsafuwisnuP6Fl8VNuXnAMUIESwSHXJihnvDF
 h+5ErS2qI3aARGwt7QbAfhLLP37yk+7giMm+y2VfPd4jFwF4NXAnzZQyq
 RxPfOVpNc0eKnUz+tAZbNclpOn+VFC56ZnEstD3Qnd1VKvwCclNrmX4lY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="385179452"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
 d="png'150?scan'150,208,217,150";a="385179452"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 09:51:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="757119420"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
 d="png'150?scan'150,208,217,150";a="757119420"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Oct 2023 09:51:07 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 09:51:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 09:51:07 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 09:51:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGFP1Y+c4/vIpDblV4XDu6WfBjeELIJUkbyueErnIH2eWlTwo4pMipqzaHcEJAWG5sFNcaj0B35lUsrPFgzbqvJpr2rAoZwH+y/B7pjeysNy4mc0eiUfg5EwBniudkjMm/Ea1gm7HrwblfShOjDIB3DXqL1X/zu3cRJ1oqW81ZUlNeTNepnkjspH1WRrX7m4WczEZOAa/Z7wZ+qsQQGvfakFtSVrVEHiF+pSQ97XFJ3Gx8GwCbS3c6xT3zr32IS/aQnfO4bg+0A5SHVTWg6S7s5j06GeYi9sVG+wNJtJ67sVFEdjokOdqPDn0EKk0Fy1SFxHZqdmkw5/yzLfWlLxNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nf8Xz3528m+zer4OLnrZl1a8w+Bp6fWjxavE6/dIre0=;
 b=DIVZAoSHU6BhxIz6s1PxMfRPG9JWC3IxNCZ68MFAp+sIRLdlaKi13hyQCRc7hm3BV8xBR/iAZxD3URtuu13jyxeXjPgh2YCG1mwqfunwTex/RhOcMC+OQ4TZPS4I4DhMRbMkb/eafft7GKA7IdYPPw4Qb4WKjDXl9098BV6E7Oz/3lvhAzkHuWRvkVT/R5nCrmV1wtuVnls6a5sanZALOudFHuUUoQ2rpr7lXpukA7zUlfuKFGIMVa62rQJbJ0Tu/I8I1rrkaYSf+jCuJl91Ea2NCOXdVaXSiDUB8+oIzMeDondrb/Fg4ReXm2iSqh9QosfFG14YOE1v9CWlXKQ7kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SA0PR11MB4752.namprd11.prod.outlook.com (2603:10b6:806:99::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Thu, 19 Oct
 2023 16:51:04 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915%4]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 16:51:04 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, "Hellstrom, 
 Thomas" <thomas.hellstrom@intel.com>
Subject: unified LRU for ttm and svm
Thread-Topic: unified LRU for ttm and svm
Thread-Index: AdoCpvUPmzfWoRX4R1GvxoQWIGmuRw==
Date: Thu, 19 Oct 2023 16:51:04 +0000
Message-ID: <SA1PR11MB6991D26064AD4933042E60EE92D4A@SA1PR11MB6991.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SA0PR11MB4752:EE_
x-ms-office365-filtering-correlation-id: 3c854773-45f8-4ca5-0f44-08dbd0c39510
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lm9e7LXcW6DubIFBkbFuGySKDaC1zT7pS576ki/JmwKT0DwMPAuGX4tDAL1XUFXpahvoovTLzobCd3Xw3egqMnXvJcc1XDMFKEIRW28FCqPQCLaIXzdzoxHSWGWFy4cEXBvuVpniZNBVKhw6WkvDFqW4AVPeeZ3Vu9Nm2N9onbhdedwi1h759oQNrZhNQEsZOcYzMrWb+SZ/HCdy4drUMIz2b3Jd4Li81qW9lW2YoZ0j6mxsQplcQ6FJIWwUbkFqGx/XIbXjM4SF63gk0k2nd1G27T5Q4c5yxoyXZh7WLgr20R9jiVmaWTHXNnB+46OJwVwiCyFojDKsADI+4sj+rcbF8M3yQF7A0dKuegE2kGmTbvdi6NL+ia77qjQ/5/VvW3S5MQAqMy78m6P52oFu0Kwpy8iFzcgeDSPsyDI73P+h5aM3TIrTzsku5Mt07W3peG71zUWAIzI0/7Oj1qe5Qedn6iBjtodSxzHFjoijGjJuf0Lpq2yFHtfhrzElarJBFUUKqoMhiwBII7K1lA04S5BRlNKMepMJx6BK/L1A0a/LlB6FoezCEhWzgIViOB2H8ZKhcDIEfwcWc9ZytePtm0fvyYl3v/4HVKdi/FBVq1s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(136003)(346002)(39860400002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6636002)(66899024)(38070700009)(166002)(71200400001)(6506007)(9686003)(2906002)(83380400001)(41300700001)(66556008)(66446008)(55016003)(76116006)(66946007)(54906003)(316002)(110136005)(66476007)(64756008)(4326008)(33656002)(8936002)(8676002)(82960400001)(21615005)(26005)(38100700002)(99936003)(7696005)(966005)(86362001)(478600001)(52536014)(5660300002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?oeEMrTdNx8oyH4odmzFRsZqDxhP/CNlHt5b1GeYbY/ckACjieR5hsV5npp?=
 =?iso-8859-1?Q?LYsBSRPbpvGiLv9iODp65p6fRfDsqBtEr0lGEG/aiktaD1o1394l1epC/+?=
 =?iso-8859-1?Q?jJIy+Tac32dHZhBUWaHdtxpJzW1vRFivF+VRZ3ARqTMVVWRS3q5ISA1jDZ?=
 =?iso-8859-1?Q?VtMAC6Msz8qoa8n6TBoQ6EduFr0uycwzENMvSDAbxpWLAn1GxcS2AcsQ+x?=
 =?iso-8859-1?Q?4sVhk9aGCxQ819tJhi7jBeLkDZNbQ0piFP7/qSx5/Mjkv7HtebiZLzcLZz?=
 =?iso-8859-1?Q?QvH3raMbUHw6Zta6vwYJsLnrrmqCVfgw9sXUWDs1GwDabjC4Ydf2wsS7jf?=
 =?iso-8859-1?Q?PxJACEI8/f9bQWwbklEEeDXc/nlpQSwmLdIefL1yBsF4ouohJ9kGeMRSeR?=
 =?iso-8859-1?Q?4ZfCchobfnEQNeGT9xEFIf+PguEyNPh9APMUcg/f2yblALGF0k5WhhjK8h?=
 =?iso-8859-1?Q?DTwR7IubfCuZxmfsVZDH/h0XmhSERPePheRvM6DrmcoVUUzWD9JNihwMfm?=
 =?iso-8859-1?Q?ua0fG/WxZLi6P/GTk3h/I7iW2rsUJhYf+4okLwzu4yql8ZnluuWXbp73a1?=
 =?iso-8859-1?Q?0F3iaEVaj/79Cm2qpZ1YHnsDq1CTwqwLZFrthgAV6GcosJDhTbpOsu7tzT?=
 =?iso-8859-1?Q?yZtkjCP0v/oEosWncHcZAhu7jGbiPf0Jpn/pWwmTwBLqfdElcJh81KpUD7?=
 =?iso-8859-1?Q?tG8Gt3EimNvdOBT2j6/LzW7rOHg1oqDNo7EQrLMM8Q/Ny06GwdnC3zkEqa?=
 =?iso-8859-1?Q?md0WcRWSwZdL18f7O0E3jqlP1XHjPftJl2+r7qc8Uvo83BcBXSQc0l+kBE?=
 =?iso-8859-1?Q?uoLYvirzmth8EWYE/b3Zt/F3ball0auJcBQQcxb478Cw/UknIY/RDOlwGU?=
 =?iso-8859-1?Q?CZDRSIq/918QO2hlTteC3NZFKVlPvhzwg/DGCsw2hFYAEOdlcgze7fCtCZ?=
 =?iso-8859-1?Q?lHIN+W3TaOUGPr+JiaZf7bQcal5mbU3llSL4sIhRcSdriUwvUa4ofUfgR1?=
 =?iso-8859-1?Q?m2yTw7B77o5sS2EprIr1TA6DvRUmfq6MvpHLWO71EtiMnnQ1yimqYOpew+?=
 =?iso-8859-1?Q?/ZVvV9IdXPaMUQ2LNLh9b0um3FN1/bf8RRS8f6tuIvYH/z6jsk/nXGQl7r?=
 =?iso-8859-1?Q?+fs1itHtMBpTsKdQBOKH/zQuF/BY4WAo2FxNS4Zsr62AbGjMaM9qzfp3+h?=
 =?iso-8859-1?Q?+7V/CO6r2/+oyLRaGaFTS1yh07wkVvTH7LQoP+F7W5Zfdf+GN4qDUfX7t2?=
 =?iso-8859-1?Q?Ozlh3zBK9F4iU0auk6cjjE4ZKTZessO+1hBcJTaS9KQPLbWDuea+IW2dAY?=
 =?iso-8859-1?Q?L/cAnPxzuUBlkzAxhAVZFmMqDXckiokN5TcUlJE7bkJ0xqNaT9E4cNbXuI?=
 =?iso-8859-1?Q?w0X2MMM2eSgDF3Te62xTJSAHjIsyT7T7KCfmLYy3XEOShvV5UxRJkISIAr?=
 =?iso-8859-1?Q?TKNlw6AvV/ECEV3+po4VmdX18XF77ScQriC192SPVOl+gTogE0mEYxNe7F?=
 =?iso-8859-1?Q?1yldnSwAXuu22YlGEt/HoOC8laP9U/GYt9k9wSqvjPVAZVegX592z6xbwt?=
 =?iso-8859-1?Q?0hB/GU7k7aMuzGFQzabS5qbI7L9t4Sn0p6YkqWViTqmSwhsMDlYJccMiUP?=
 =?iso-8859-1?Q?in0lIIX6q81c8=3D?=
Content-Type: multipart/related;
 boundary="_005_SA1PR11MB6991D26064AD4933042E60EE92D4ASA1PR11MB6991namp_";
 type="multipart/alternative"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c854773-45f8-4ca5-0f44-08dbd0c39510
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 16:51:04.0650 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: caP7VL89uB9n0es7WN97/IlXdPqWClPemt6IfmG3ub1tcOX4k+BT9cujCEcbRECBMGPzG/izW16VOFcZeEZj8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4752
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 Philip Yang <Philip.Yang@amd.com>, Felix Kuehling <felix.kuehling@amd.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_005_SA1PR11MB6991D26064AD4933042E60EE92D4ASA1PR11MB6991namp_
Content-Type: multipart/alternative;
	boundary="_000_SA1PR11MB6991D26064AD4933042E60EE92D4ASA1PR11MB6991namp_"

--_000_SA1PR11MB6991D26064AD4933042E60EE92D4ASA1PR11MB6991namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello all,

As a follow up to this thread https://www.spinics.net/lists/dri-devel/msg41=
0740.html, I looked further into the idea of a shared LRU list for both ttm=
/bo and svm (to achieve a mutual eviction b/t them). I came up a rough desi=
gn which I think better to align with you before I move too far.

As illustrated in below diagram:


  1.  There will be a global drm_lru_manager to maintain the shared LRU lis=
t. Each memory type will have a list, i.e., system memory has a list, gpu m=
emory has a list. On system which has multiple gpu memory regions, we can h=
ave multiple GPU LRU
  2.  Move the LRU operation functions (such as bulk_move related) from ttm=
_resource_manager to drm_lru_manager
  3.  Drm_lru_manager should be initialized during device initialization. T=
tm layer or svm layer can have weak reference to it for convenience.
  4.  Abstract a drm_lru_entity: This is supposed to be embedded in ttm_res=
ource and svm_resource struct, as illustrated. Since ttm_resource and svm_r=
esource are quite different in nature (ttm_resource is coupled with bo and =
svm_resource is struct page/pfn based), we can't provide unified eviction f=
unction for them. So a evict_func pointer is introduced in drm_lru_entity[N=
ote 1].
  5.  Lru_lock. Currently the lru_lock is in ttm_device structure. Ideally =
this can be moved to drm_lru_manager. But besides the lru list, lru_lock al=
so protect other ttm specific thing such as ttm_device's pinned list. The c=
urrent plan is to move lru_lock to xe_device/amdgpu_device and ttm_device o=
r svm can have a weak reference for convenience.

[cid:image001.png@01DA0285.844FA910]


Note 1: I have been considering a structure like below. Each hmm/svm resour=
ce page is backed by a struct page and struct page already has a lru member=
. So theoretically  the LRU list can be as below. This way we don't need to=
 introduce the drm_lru_entity struct. The difficulty is, without modify the=
 linux struct page, we can't cast a lru node to struct page or struct ttm_r=
esource, since we don't know whether this node is used by ttm or svm. This =
is why I had to introduce drm_lru_entity to hold an evict_function above. B=
ut let me know if you have better idea.

[cid:image002.png@01DA0289.9AD5D110]

Thanks,
Oak


--_000_SA1PR11MB6991D26064AD4933042E60EE92D4ASA1PR11MB6991namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1503928921;
	mso-list-type:hybrid;
	mso-list-template-ids:336367340 269025297 269025305 269025307 269025295 26=
9025305 269025307 269025295 269025305 269025307;}
@list l0:level1
	{mso-level-text:"%1\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-CA" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">As a follow up to this thread <a href=3D"https://www=
.spinics.net/lists/dri-devel/msg410740.html">
https://www.spinics.net/lists/dri-devel/msg410740.html</a>, I looked furthe=
r into the idea of a shared LRU list for both ttm/bo and svm (to achieve a =
mutual eviction b/t them). I came up a rough design which I think better to=
 align with you before I move too
 far.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">As illustrated in below diagram:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0cm" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l0 level1 =
lfo1">There will be a global drm_lru_manager to maintain the shared LRU lis=
t. Each memory type will have a list, i.e., system memory has a list, gpu m=
emory has a list. On system which has
 multiple gpu memory regions, we can have multiple GPU LRU<o:p></o:p></li><=
li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l0 level1 l=
fo1">Move the LRU operation functions (such as bulk_move related) from ttm_=
resource_manager to drm_lru_manager
<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso=
-list:l0 level1 lfo1">Drm_lru_manager should be initialized during device i=
nitialization. Ttm layer or svm layer can have weak reference to it for con=
venience.<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-lef=
t:0cm;mso-list:l0 level1 lfo1">Abstract a drm_lru_entity: This is supposed =
to be embedded in ttm_resource and svm_resource struct, as illustrated. Sin=
ce ttm_resource and svm_resource are quite different in nature
 (ttm_resource is coupled with bo and svm_resource is struct page/pfn based=
), we can&#8217;t provide unified eviction function for them. So a evict_fu=
nc pointer is introduced in drm_lru_entity[Note 1].<o:p></o:p></li><li clas=
s=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l0 level1 lfo1">Lr=
u_lock. Currently the lru_lock is in ttm_device structure. Ideally this can=
 be moved to drm_lru_manager. But besides the lru list, lru_lock also prote=
ct other ttm specific thing
 such as ttm_device&#8217;s pinned list. The current plan is to move lru_lo=
ck to xe_device/amdgpu_device and ttm_device or svm can have a weak referen=
ce for convenience.<o:p></o:p></li></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><img border=3D"0" width=3D"1057" height=3D"161" styl=
e=3D"width:11.0104in;height:1.677in" id=3D"Picture_x0020_1" src=3D"cid:imag=
e001.png@01DA0285.844FA910"><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Note 1: I have been considering a structure like bel=
ow. Each hmm/svm resource page is backed by a struct page and struct page a=
lready has a lru member. So theoretically&nbsp; the LRU list can be as belo=
w. This way we don&#8217;t need to introduce
 the drm_lru_entity struct. The difficulty is, without modify the linux str=
uct page, we can&#8217;t cast a lru node to struct page or struct ttm_resou=
rce, since we don&#8217;t know whether this node is used by ttm or svm. Thi=
s is why I had to introduce drm_lru_entity to
 hold an evict_function above. But let me know if you have better idea.<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><img border=3D"0" width=3D"1083" height=3D"255" styl=
e=3D"width:11.2812in;height:2.6562in" id=3D"Picture_x0020_2" src=3D"cid:ima=
ge002.png@01DA0289.9AD5D110"><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Oak<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SA1PR11MB6991D26064AD4933042E60EE92D4ASA1PR11MB6991namp_--

--_005_SA1PR11MB6991D26064AD4933042E60EE92D4ASA1PR11MB6991namp_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=41996;
	creation-date="Thu, 19 Oct 2023 16:51:02 GMT";
	modification-date="Thu, 19 Oct 2023 16:51:03 GMT"
Content-ID: <image001.png@01DA0285.844FA910>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAABCEAAAChCAYAAAD5jaU1AAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAKOhSURBVHhe7Z0FgCTF9f/fyrm7u3CGu3MElyBR
EuJC9A+RX1yIhxjEIQkhIUiEBHe/O+CAU87d3d1W/vV93bU7PfWqt2t2du9u732gb6dfvfpWT3dV
TXV1VXVJtYHqYNu2bbRlyxYaOHBgbFEURVEURVEURVEURQmjNP6rKIqiKIqiKIqiKIrSoGgnhKIo
iqIoiqIoiqIojYJ2QiiKoiiKoiiKoiiK0ihoJ4SiKIqiKIqiKIqiKI2CdkIoiqIoiqIoiqIoitIo
aCeEoiiKoiiKoiiKoiiNgnZCKIqiKIqiKIqiKIrSKGgnhKIoiqIoiqIoiqIojYJ2QiiKoiiKoiiK
oiiK0ihoJ4SiKIqiKIqiKIqiKI2CdkIoiqIoiqIoiqIoitIoaCeEoiiKoiiKoiiKoiiNgnZCKIqi
KIqiKIqiKIrSKGgnhKIoiqIoiqIoiqIojYJ2QiiKoiiKoiiKoiiK0ihoJ4SiKIqiKIqiKIqiKI2C
dkIoiqIoiqIoiqIoitIoaCeEoiiKoiiKoiiKoiiNgnZCKIqiKIqiKIqiKIrSKJRUG+LPXhYtX0/b
tm6lvv36xRZFUfJp1aKc2rVuFu81fdZv2RN/UhQlje6dWsWfFB8HKqpo6459VGeDRFGOYNDGQFtD
qZsNpo2i9YmipHMw65RMnRAvTFpJP/jzG1ReXkolsU1Raihapjg8cxeKUOf2LemOb4ylju1axNam
zzMTl9NP7ppEZWWNM6BK657DkCP5oplf1gOVVfSrL5xNJ4zoFhsVH/sOVNLtD8ygR8YtobJSLe1K
Hkd6O6Oqmo4d3pVuvuFUatvqyHnYUR+efX0F/fiuN6nctFG0RlEcipIpDt+chTrlmGFd6Hs3nEZt
D9ID1MydEC+b7V1vG0rNm5XF1lxqL0LNpzqui98vMtSl44lWQ0nGiKKXJ6pEXa4c7jglDTV7dYkZ
ZF9/RA7JoGtJ93cDaiyhaTikC5QE6APX3y8Qqg1y42BEwPf+9MYR2Qkx8a21dO3YIdS8XOqIqD1J
Wc6x3ycK4H+z6NT8I1NTN6T65JDi51C3NMPholPS6PdzkX3lyCG6IN2/iGmIeEKMOUA+QoxTJP08
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

--_005_SA1PR11MB6991D26064AD4933042E60EE92D4ASA1PR11MB6991namp_
Content-Type: image/png; name="image002.png"
Content-Description: image002.png
Content-Disposition: inline; filename="image002.png"; size=39944;
	creation-date="Thu, 19 Oct 2023 16:51:03 GMT";
	modification-date="Thu, 19 Oct 2023 16:51:03 GMT"
Content-ID: <image002.png@01DA0289.9AD5D110>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAABDsAAAD/CAYAAAD/hd2TAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAJudSURBVHhe7Z0FoBzF/cd/T+JGEggREiAQCBDc
3d1K3QVaSl2pUKGlVKnQFkpL+y+lWKFYkSLF3SUQiBMhCXHXZ//5zt28u735zb6de/fyXi7fD2ze
7W9+85293ZndudmRmhaDEEIIIYQQQgghhHQSTU1N8uabb8q4cePylvZRm/9LCCGEEEIIIYQQUhWw
sYMQQgghhBBCCCFVBRs7CCGEEEIIIYQQUlWwsYMQQgghhBBCCCFVBRs7CCGEEEIIIYQQUlWwsYMQ
QgghhBBCCCFVBRs7CCGEEEIIIYQQUlWwsYMQQgghhBBCCCFVBRs7CCGEEEIIIYQQUlWwsYMQQggh
hBBCCCFVBRs7CCGEEEIIIYQQUlWwsYMQQgghhBBCCCFVBRs7CCGEEEIIIYQQUlWwsYMQQgghhBBC
CCFVBRs7CCGEEEIIIYQQUlWwsYMQQgghhBBCCCFVBRs7CCGEEEIIIYQQUlWwsYMQQgghhBBCCCFV
BRs7CCGEEEIIIYQQUlWwsYMQQgghhBBCCCFVBRs7CCGEEEIIIYQQUlWwsYMQQgghhBBCCCFVBRs7
CCGEEEIIIYQQUlWwsYMQQgghhBBCCCFVBRs7CCGEEEIIIYQQUlWwsYMQQgghhBBCCCFVBRs7CCGE
EEIIIYQQUlWwsYMQQgghhBBCCCFVBRs7CCGEEEIIIYQQUlWwsYMQQgghhBBCCCFVBRs7CCGEEEII
IYQQUlWwsYMQQgghhBBCCCFVBRs7CCGEEEIIIYQQUlWwsYMQQgghhBBCCCFVBRs7CCGEEEIIIYQQ
UlWwsYMQQgghhBBCCCFVBRs7CCGEEEIIIYQQUlWwsYMQQgghhBBCCCFVBRs7CCGEEEIIIYQQUlWw
sYMQQgghhBBCCCFVBRs7CCGEEEIIIYQQUlWwsYMQQgghhBBCCCFVBRs7CCGEEEIIIYQQUlWwsYMQ
QgghhBBCCCFVBRs7CCGEEEIIIYQQUlWwsYMQQgghhBBCCCFVBRs7CCGEEEIIIYQQUlWwsYMQQggh
hBBCCCFVBRs7CCGEEEIIIYQQUlXUtBjynzcas+evkokzlub3CCGl9OxRJ3uM2VIG9Omet5A0ps9Z
IdPeXp7fI4SU0q9PNxm3w2Dp26tb3kKyglrS5NnLZNa8lXkLIaSYHt3rZE/UWfqyzpKFxqZmmThz
mcxbuDpvIYQ4mpubZcXSBXLyUXtJ397tr7N0SmMHfpR889InZN+xW0l9nda5pCb/N/+psFsWiehl
atVoEdt5XCHalM2QbvSheRF0hWhdUFak7EQfaRnHExUlUr/UffW6RplsHoK/P/8INnZk5LkJ8+W3
170su5sfc3W12gUo2OynyGtUSiJ6mVpVfU9RncMKUdogOkIc0UcaeTwd/X1L3ZetWi8rVjXIj887
kI0dZYBa0r1Pz5Qb758sO43aQmprSs9wYd9+irxepXjRy9DbmPcX0KZ0Gw7Rh+ZFCCtEa4OyImWj
rCONPJ4o9zK+a3EU1FnemL5ELv/2UWzsyAgaO264b4o88fIc2W54f+USFCz2UxnXqBgvehl6rLMU
iNIG0RHiiD7SyOPp6O9b6r589QZZsnydXPy5gzftxo5fX/OSfO1De0mfnvV5K0h+XbvXxglrDfb8
coaEOaDVlk/WAu6ZSgyFXSUyyJsDoTlMYDJc8fZ8Usg7tqmZx6vjtYXx16MEhCL0rWvQPyXV2DRA
Ik6KNojVL/F/Z9Ea+fGVz7GxIwI0dtz+8DQ554xdpWf3urwVJE+udr5LaQ32/HKGhDlFK6wDk2r0
8EwlhsJuemQltIAJTIbrWqkaxai+KbFjtEHQP6ASIW5dg/4pqbY7jRRt0E79abOXy1V3vMnGjjJx
jR2vTVkk7z92R+lWX/ySJnmy23pGtgZ7fjlDwpyile6n3mFUvTSd5G56ZCU0Rz6gLa2ouoXxbUuv
Fc+3DfLOepyAUsYErFvQt40UM6YB9HRS9GO1QVGc+YvXyPf/9AwbOyJwjR1r1zbISQePKnpJk7wY
di9p8mgN9vxyhoQ5RSvdT7mnKFpt+RR20yMroQVMoB+uWFJFisio14rqn0KqfyAkYwLWLeirB6TH
0dHPpW9stUToW9cS/xlzVshfbn1902/s+O21L8v5H91H+vRyjR2Fb5r1ZGknKEfOmAgKaKX5lP2D
BBQZk+FhAVWnCD+zlSi3JVBC1swLYrVBjD6ISSPsWxl9hx9HF6mMdo55i9bI9y5/mo0dEaCx445H
pstn3z2uqLGjcIJbP7VxnWyw6pMzJoICWm35ePcV1UehyJgMDwuoOkVkyd8xeTtreQGVLDOhdNp3
7I6wSOx30P0DIsYcKR88nimzlsuVpuLAxo7ycI0db0xbLB86Yaeixo7CCbef2rhgrcGeX86QMAe0
2vLZKPWW/K6qUUSW/N7+MhQWaL+2ozJpxOrHHj/w44RFKqOPFzRr5Vt/eIKNHRG4xo4NGxrl1EO3
Uxs77Kc2rlHYJ2dMBAW02vKpxD0lGRaOrGoUkSV/x+Rr3VcXqFR5yVGZNGKOH2wa+hiavlIuu/GV
ijV2dJEJSnPfFv/aT60fdBJ+CXIhreEgsZMkYQ74JCjxUaWLjH54iXfewfdLgszgZ4i0GOmE9XxN
3TedcJywUNY00o9HD0iPo6PHCevHED4eGN1G2kfhHLZ+Sjmt9qzbf+xuETljIkj1U8wlPlDxKg0B
HY+8EX8K4ck9S96khCTQ82DSEM6nOm3pOWJ1QTgOjLpYTBrlaMfog3AaPlY//zkL4eOBMUaJZKNw
Xls/tXGaW308v5whYfZ8crTlo95f2jYljMnw5J6lyC+EjeU5WGvuYx49z+roeVwX0H3T0f1hbH8a
YV8YdZGs2g49jbB2ZfRBpBApwZ0//M19bv3kggKEfXLG1iB8UPw8c4lPsM7StilhTIZ5ngG/JHr+
SxrCeVRH19MFYnRB+Fgqk0a6vk6MPojRDx9PmLB/pFAGukBjR+5LtX61Nr6jDcY/Cb+cIWH2fAq0
5ecVcNVHoSRKgRKB/G6J1UPPPH6smEym+/nGGE1Hehw9ICaddG0/MEbboceBwRcqV18nUoikkDuX
+Nd+av2g0+rjkTO2BuGD6ldiVvy6foUhaYzJ12FNnxhdoGsDGMNpZE0nXV8nq7ZDTwMGXyh8PGHC
/pFCJAM4p7nz2vqpYFJJ+CXIhbSGg8ROkoRZ8VHvMUVg14tWZPTDS7zzDr5fEpsfPQc/RtZ8rpcJ
GHTNrLqOcBxdKCaNdN/26zt0f99YrnZYP1KMBMidx9Yz2saptcGqT86YCPJ8ciTMiQg5KlVnKYQn
9yx5kxKSIJz/CsTkaz1P6wK6bzq6P4ztTyPsC6MuEqPv8P11/XK19TgwRoplpFMbO1CY7Fdz3y/w
HVuDVR+lYHs+OdL8cseS+6+VEh/gmZwhb0yGJ/csZlexJtAzQjKW8/H9fHRf7LitQFbNYtLjICAZ
6PyzpJPuC6MfkFW7GD0ODEmj84vRT48DY4QYaYNcCbbnOuXUtgarPoU7gQ1SfXIkghS/glIRym7C
5Ax5YzI8uWcxuzZ/5T6q6PnPj6H7+Ti/pC923FZA900n3V8PyJqG89N9YfQD0uPo6P4w+CLlautx
YIwQI9HYs9vGaW4N9vwKd4VEeMInRyIosZPDKeXU8ng+id0cRUY/vMRiPtq8lvuooudHF6Ng1P10
dD8Y/MhZNR3OX48Dox8Qk0a6LwJKAvP+WfWB80/GwY7bCsRqg3AcGCPFSCqtZzTl1Loge008n8Jd
wAa5D55fiVnxKSgVoeyWmBLGZHhyz2J2bf7KfVRx+S+ZB12MgtH3CaP7wpA0Or+suiA9ji4Uk0a6
th/g/LPqAz0OdnyRWG0QjgNjpFgknduzo43v1xqs+ilF0vPJkYie2MnhFWyQxVRkwMfCbnLPYnbt
hc7vaugZAYakUc8sOln0HDG6jnAcPZ32HbtD1wax3wH+fpywfiyx30E/HpIVe+raOH+tPp5fZe8p
JUoBvxKC4Xpkm1/yuxp6foIhaYzJd7qfHjmrpiP9OBDgB6bHSZLu1z5thx4HBl+oXH2dyqVBwthz
mXI+W4NVv2z3F9AapOiUfX8BRcZkuC5QYvHw85avE5MHdV8YdIGsuo6wv56GfjxhytLPf86Cfjww
6Coxxw50fUdl0iAF7KnDPynnsDVI9cl2T4E5oVPiV/Y9pcQnGe55W5NibUXPfzAkjen5NElWTZBV
05F+HOE0sqbTtr5PVm2HngYMvlD68eikx9EDYtNoiy4yZ0cK3heGQSncyonxzCU+MYW7xJQwJMP0
yCVWD/3CJo3pGcbH9w1Hjs1Y4WOBURdr37E7wtox+sD3h6Ej9UF6GqQdhE+tpTVY9fHuBKpfqwZI
7OSo5D2lsOt5WpNiTZAlf8fka90XBl0gq64j7K+noR9PmFj9wNdKxU8joG2IOXZH+nfwKScNUj72
dOMf77znjAmz55MjEV3xUe5Unl9Cw1FkTIYn9yx5U4nVQ8/vSWLyoK6nC8A3Nn+H/cNpZCV8PDC2
Xx+E9RWMuTL6AAF+IPxj0yAlpJy/1rPe+qEYpbbh+eRI81FUcj5tmxKGZLjibXZtfsnvauh5KWmM
yXO6Lwy6QFbdbLQ/jbAvAtqvDzr6/MR+B/iXk05bdMnGDnsK1POQMyTMnk/O5PkUGdpduPPGZHhy
z1Lkl4Z/YX2tmIuvZxZdQPdNR/eHsf1phH1h1EWyajv0NMLaldEHYaHYNEgc9vTiH+8854wJs+pX
YioJ36j3FLOVWD38/JQ0hPOojq6nC8Rqg7B/OI2shI8HxrC+HqKjp5GiHSNuCMeB0Q8oJw1SPvYq
qJciZ0wEqX6KucQn5h7jkTcm3ZN7lrxJCUmg56+kITYPtqXniNUF4Tgw6mIxaZSjHaMPfP829POf
sxA+Hhh1pdjjJ3HY06ue/pwxYVb9SsyKj3c/AVlMRVpFHw3JPUveVGL1yJK/Y/JcFj0HfGPzczgO
jH5ATBqx2iBGH+j+YYEYbRA+Hhj9gLB/ZegyjR3u69svm/jCOYN7zNsg98HuJEmYFB+vcKs+nqnV
6MIK4ck9t2svXH5Xw13Y5MX1Y/g+YcJ6SQHnl1UXhOPAoAvFpBH2hdEPcP5Z9YHuD4MvUq52WN8L
SIlDKoU98/Yfu5snZ4i5p7SaFZ/23lNKPhqSe27X5pX8roaen/wYyfB0fD2gC+i+YZy/ru+2JDFp
hH1h9AOcf1Z9oPvD4IvEaoN0fV+snDRI+diroF6KnDERpPop5hJD4U6Vx4WnmxLGZFhyz5I3KSEJ
0vNjjpg86HyT/tjxBWJ0HeE4MPoBzj9LOmFfGHSBrNrF+HGw44s4vxj9sD+MulBsGiQOe+bV058z
JoJUvxKz4tPue0ryoyG5Z8mblJBWXF5K5ic/hu8TRvfVI8foAuev67stSUwaYV8YdZEYfaD7w+CL
ON/26wMYdaEY/XLpEo0drd/T+8LZCjZoy88r3EDZLTEljF5YqcXsFrmr6BnBjxXOMD5hTZ+smo70
4winkTWdaP0IbYeeBgy+UPrx6FTmeEglwem1p9g7zzlDwuz55IC5NSixk6NS95RkeIl3kV8afn6C
IWmMyXe6Lwy+QIyuI+yvB8Skke4b1o9BTwMGXyj9eHTCccJCsWmQ8sGptqfbO+e5kNZwkNhJkjAr
fh1+fwHG5Psl0fOjHytrHsyqB3TfdNLj6AFZ0yhXO6u+Q48T1o8h/XjCacSmQ7KDU2tPr3eOcyGt
4SCxkyRhVnw2Sp3FbL5fEj0v+caseU7PnzDomll1HWF/PSAmjXTf9us7dH/fWK52WF8XKyedcunU
xg77Re2H/JbAK5JBWv0UHaiohVsxeRQZk+G6QInFw7+ovk7Mxdd9YdAFsuo6wv56GvrxhClLP/85
C/rxwKCrxBw70PUdejqxaZA4Ws+6evpzd4JWs+qTI2FWfMq6p5T4JMNLAoHZVawJ9Dzox8ia78J6
umZWXUd6HD0gaxpta/uB6XF0dH9dpBztcJxwGrHpkHaC8+2d85L7Cwhcl4SfFwm7uf8SlOyqBH3U
RHJ5J7+roectGJLGmDyo++mRs2o60o8DAX5gepwk6X7t03bocWDwhcrV16lcGiQ7rWe99UMxJfcU
1SdHW35Z7iklu55OMrwkEJhdxZpAz09+rJh8l0XPEqHpSD8OPSAmjXRtPzD9eHT0ODD4QpXRdugB
6XE6hs5r7HBf1PvCSpHEjnJiEmY1PBCpiISGo8iYDE/uWfKmEquHf2H9GDEXX9fTBcrJWGH/cBpZ
CR8PjO3XB2F9ncroAwT4gfCPTYPE0Xp6vfMcuKcowJzQKfFTlDwf4JmKDPhY2E3uWcyuzS/5XQ09
P8GQNMbkuyx6jqyajvTj0NNJj5OkI7UdehwYfKFY/XR/BPiBsWmQ9mOvhHrOvbtCzrkEGz/3sWQn
R/D+0rYpYUiGe57WpFgT+N8ThqQxJg/qvjDoAll1HWF/PQ39eMKUox+Dfjy6NqiMvqMyaZAy8c6z
cicIXAuYW4MSOzkUpYBfCanhfqDNX/ldDT3/wZA06n46YU0f65v/nIX040CAH5geJ0nb+klitB16
HBh8oXL1w1QmjUrRhSYoxRkoKpK53dxWhGcu8XEFu0ip4KOYEhQZk+HJPUvepIS04i5s8uImY+g+
YdrSKyZGFzh/Pw4MbksSk0bYF0ZdJEYf+P7YcVsS59s+fQeMfkCsPmkniXOduyaKySNhLvEp3FES
RsXPMyUMybDkniVvKrF6+PkpHzGPy3NZ853vix09coyuQ/d3afiBMWmEfWHURbJqO/w0nLYvFD6e
MGH/yqVBKkTivOeuT+LOkDOV+JWY1PCESg7Vr8TkDGYr+lj0Kbdnye/a/JOzqPj5CzvJGDF5MKzn
CzjfrNog7A+jHxCj73x9fxjcliRGH6Tr+1RGH8DotgLOPyYNUily1yNx6nMmj4RZ8fHuKc4n3ZQw
JMOTe5b8bpFFxc9L+YhFxOQ53xc7bksSo+sI+7c/jbAvjG5LklXboacR1q6MPoDRbQXKSaPSdIHG
jtyJSZyewEnxzCWGkltELrxtU8KYDE/uWfImJSRBOCMUiLn4embRBXTfdML+7U8j3bf9+g7fv7La
ehwYdbHYNEilyF2TxJVJ7BTwzCU+3j0FeD6eKWFMhif3LHmTEpJAz4NJQ0yey6Ln0H3TCccJC2VN
I11bFwnHCeP7hwXK0dbjwKiLxaZBOoLc9UlcpcROAc9c4gMV7x7jRVJNCUMyTI+c/xNEz49+jJg8
2FG+QD9eAKMuVpnjCWvH6IPw8ftUVj+cBukMctckcWUSOwU8c4lP8J5SgmJqNeJPITy5Z8mblJAE
ep5NGnSfMG3pOWJ1QTgOjLpYTBrlaMfoA98/XT+G8PFULo2OohMbO3InJ3GKEjtJEmbFzyvcCp5H
iU4yXNEzppIoHnpm8GNlzQBZ9YDum056HD0gaxpta/uB6XF09Di6SGW0HeE0YtMhlQAnvQPvKaqP
QpExGa5ENlv+TxA9P/mxYvKc7usb9bTTCceBUReLSSfs135thx6nMvpwDftXJg3SsSQuReC6eD4l
fmqdxfPxTAmjH17iXeSXhp+3YEgaY/Kg7guDLxCj6wj76wExaaT7hvVj0NOAwRdKPx6dcJywUGwa
pFJs/DpLiSlhTIZ5ngG/JHr+gyFpjMlzYU2fGF2gazvCaWRNJ8bXUY6/H0cXqezxVC6NjqTTGjtw
DlrPQ2InSVt+KNxZC3iC1HA/0F64/K6GfmFhSBpjMoDup0fOqulIPw4E+IHpcZKk+7VP26HHgcEX
Kldfp3JpkMrSevr1S2RJBCl+wXtKEUq0hNEPL/Eu8guh5ycYksaYfJdVE2TVdKQfhx6QHidJufox
6GnA4AulH4+O9Vfj6AHlpEE6ltbLoV8yS8Ks+JRdZykyJsNLAoHZVawJ9Pzlx8iaB8N6umZWXUd6
HD0gaxpta/uB6XF0dP/KaYfj6AHlpEM6iJTrkAgq8dtodRaz+X5J9LyUNMbkOd0XBl8gRtcR9m9/
Gum+CPADY/Qdvn9ltfU4MOpisWlsDDp3GEv4XCWDSvxyuyWF2/mkmxKGZHhyz2I+2gud39XQMwIM
SaPu5+P8kr7YcVuSrLqOdH8EJAOdf9Y0wr4wuq1AjLZDjwODLxSr7/z1ODD6AbFpkA4mcC0SVy+x
k8O7p4ASPyVawpgMd3sFCz7a/JL7qKLnJz9G1nzn/JK+2HFbkqy6jnR/BPiBMWmEfWF0WwHnn1Uf
6P4w+CLlautxYPQDYtMgGxH9krWabVBiJ4e7vyTuMSU+wDOVGJK7JYHA7Nr8k98txeWtZP7Cjtty
6H46uh8MfuSsmg7nr8eB0W0F0uMkSfdDgB+YVdvh/JNxsOO2ArHaID0OApKBzj82HdIBuMujXItE
UGInh3c/ASU+oGTX8yl8dAHJQJtXch9V9PzkYhSMvk8Y3RcGXyBGFzh/PQ6MfkBMGm1rJwOdf1Z9
oMfBji8Sqw3CcWD0A5x/bDobiy40QWmOxGlM7OTIFWzP6OGZiqIVfTQk9yx5U4nVw7+o+YhFxFz8
LHqOGF1H2D+cTlbCxxPWjj1+4MepnH7Yv3JpkA4kcJkSZsWn7AoDKDImw5XIZiuxemTJ3/DJmu90
Pz1yjK4j7I8APzA2jXR9n3KO348DQ+X0dfQ09OMhXZ3WS6Zc1pj7S4kpYUiGK955U4k1A8kYsXnQ
94VBF6hc3q5MGmHfyuiDjj4/sd+hnDTIxiVx5ZTL2HH3lBKMSbEmyJK/4ZM13+m+MOgCWXUdYX89
Df14wqTr+5Rz/H4cGDpS31GZNDqDLtXYkThfysmrVOEuoEfO/wmiZwY/RkwG6ChfoB8vgFEXC8fx
Cfu1X9uhx6msvg+MlUuDbFy8q1dyvdpdYcgbk+HJPUuRXwg9PyUNsXlO19MFYnRB+Fgqk0ZH64Ow
vk/4eMKE/SOFSJcFVzLtanr3F1BiUjWKjMnw5J4lb1JCEuh5OGmIyeNZ9By6bzrhOGGhrGmka+si
4ThhfP+wQDnaehwYdbHYNMjGJ3GJSq7XRq2zmK3E6tFW/g7nUR1dTxeI1QZh/3AaWQkfD4zt1w8T
1o7VD/sjIJzOpkCXaOxInEblnHoFXPXxTAmjH17iXeSXhn9hYUgaYzKZ7guDLxCj6wj76wExaaT7
hvVj0NOAwRdKPx6dcJywUGwaZOPjXaISw8auMJSEJMiS/2LynJ6ndQHdN52wf/vTCPvCqIvE6Dt8
f12/XG09Doy6WDnpkM4lcbmUS5v1HuNRZEyGK5HNlv8TRM9bfqyY/Kf7+kY97XTCcWDUxWLSCfu1
X9uhx6msvg+MlUuDbDzclUtcopLr5d1PQBYTDHlj0UdDcs+SNykhCfT8lDTE5re29Bx62umE48Co
i2VNo1ztrPoOPw52dJH2azvS04hNpzPp1MaOxGlM7OTINXF4xgRKtIQxGe72ChZ8tBct91HFXdTk
hfVj+D5hwnpJAeeXVRekx4HRD4hJo23tZKDzz6oPdH8YfJFytfU4MPoB6XFIVyFx9dxO0TWr/D0F
lHibXZtXch9V9PzkYhSMvk8Y3RcGXyBGFzh/PQ6MfkBMGum+Ye2s+kCPgx1fJFYbhOPA6Ac4/9h0
SOfhrmTrJUvs4GPhv1Y8H8+UMBZ9zJPcc7slVg89byVjxeRB3Rc7biuQVbOYcBwY/QDnnyWddF8Y
/YCs2sX4cbDjtgLOL0Y/HAcGXSg2DbLxSVwedymLjN79BHg+nilh8MJK9pyD71fAhsEn4eBiFIwx
ec756ppJYnQd4Tgw+gHOP0s66X56QFZth/NPxsGOL6L7phP2h1EXik2jq9D5PTuUc5qlcIOSXc8n
Ge55W5NibUW/qDAkjTEXP6ypkFGzmPBxIMAPjDl2kK7vE6MN9OOBoXL6YfxA/XhIlwbXq+Saddw9
pSSG2S2xeGTJ3zH5TveFwReI0XWE/dufRrovAvzArNoOPY2wdmX0HXpAbBqki4HrV3INvfsL8HxK
KNFJhpcEArOrWBPo+dGPlTUPZtVzZNV16PqO9qeRru0Hph+Pjh5HF6mMtiOcRmw6pJNRrtfGrLOU
WBPYvOQ5+DGy5jk9f8Kga2bVdaTHUQIi0mhb2w9Mj6Oj+1dOOxxHDygnna5E5zZ2lJy4mB8kJaaE
IRmueOdNJdYMJGPEXnzfFwZdwGrnP2dFP5b0NLJij6cD9YHvn67dfn2Hnk6sPumabKx7is2T+V0N
Pc/6MbLmu7CeLpBV16HrO9qfRrp2+/WB7l8ZbRD7HeBfTjqki6Bc1ph6SxrJcF2vTQ3PIR+xiJg8
qPvpkWN0HWF/BPiBsWmk6/uUc/x+HBgqp6+jp6EfD+nSKJcyeE8pwTMVGfCxsJvcs5hdm1/yuxp6
foIhaYzJd1n0HFk1iwnH0dOxx57/XD66Noj9DvZ4vDhh/VjKOj+VSbpT6TITlHoFG5SYsOt5FRmT
4ck9S96khCQIZ7YCMRc/i55D900nHCcslDWNdG1dJBwnjO8fFihHW48Doy4WmwbpIhRdt7IrDCBv
xJ9CeHLPkjeVWD30/J00hvOpTxY9R4yuI+yvpxObhu6ra4Ny9H1/GHSRGG0QPh49jbA/2VQJ3l/a
NiWMyfDknqXIL4Sev5KG2Dyo6+kCMbogfCyVSaOj9YHvn67dfn1HOA2yadPue0qeZJjnaU2KNUGW
/B2Tr3XfcOSsuo7wscDoB4T9ddL1fSqjD4MuUhl9hx8Qq9/V6QJzdpQU7pwxt+Up2c1RZEyGJ/cs
eZMS0oq7sMmL62IUjDEZQPeFwReI0QXOP6zvBaTE8Qn7wagLZNV2OP9kHOz4IrpvOmF/GJWAvH9M
GqTrEXNPKTIljMmw5J4lb1JCEvj5yY8Rk+d0Xz1yjK4jrO+2JDFpON+wvk+MviOrvtOO0Q/7w6gL
xeiTTYPE/QUol98zOYPZij4WfcrtWfK7Nr/ldzX0/JiMofuE8f2x4ws4v/ZpO2DUhbKm4fx8Xxjc
liQcJ4zvjx1doFxtPw4MbksSmwbpenh1FlByud1uwqvIWPSx6FNuz5LftfklZ1EJ578CMXkurOcL
ON+s2iDsD6MulFXfafv+MLgtie6fTljfJ1Y/7A+j25LE6G8qdJmeHZaSE6xehiKjH17inXfw/ZKE
M0KBcIbx0X1h8AVidB3l+GeNk+6rB8ToO3x/GHyRcrXDcfQAGyf/mWya4PqpFYYicj4lFBn98BLv
vIPvl0TPg36McD5NEtbTNbPqOsJxwkJZ00g/Hj0gPY6OHiesH0P4eGAMpxGbDunqlPwoUS6/YkoY
kmF65PyfIHre8mPF5L+wpk+MLtC1HeE0sqZT2ePR0ePoIuXq61QuDdL18C4hDCVG9TLnjb67Etls
vl8SPT/5sWLynO7rG/W00wnHgVEXi0kn7Nd+bYcepzL6YX8YdaHYNDYlOrmxo+isZjnBQXfslQiY
XcWaQL+wfqysFz+rniOrrkPXd+jpxKRRjnaMPtDj6CKV0XYgwA9Mj0M2aUquq3qZi4zJcOz5Aoo1
gZ6f/Fgx+U73840xmo70OHpATDrp2n5gjLZDjwODL1Suvo4eUE4aZBNEucaeCYYiYzJcETDo1gJ+
3oKhRNnsZs2Dui8MvkCMriPs3/400n0R4Adm1XboaYS1K6Pv0ANi0yCbCCXXFbvepS4yemGllqBf
AT3/wZA0pufTJFk1QVZNR/px6AHpcZKUqx+DngYMvlD68ehU5niqi85r7MCJLd6KUEwJQzJMj1xi
9fAvbD5iETEZQPcLRI7QdYT9EeAHxhw7SNf3Kef4/TgwVE5fR09DPx5SFSiX3LvUJT7JcM/bmhRr
K3p+giFpjMl3WTVBVk1H+nGE08iaTtv6Plm1HXoaMPhC6cejkx5HD4hNg2yC4BqXXGfFlDAkwxVv
s2vzW35XQ8+PfoyseTCspwtk1XXo+o72p5Gu7QemH4+O7q+LlKMdjoMAPzA9DtlkUS63d5lLfJLh
JYHA7CrWBHpeShpj8pzuC4MvEKPrSPdvXxrpvgjwA2P0Hb5/ZbXDcRDgB8amsanShSYoVS5FkbHo
Y9Gn3J4lv1ti9fAzgx8jPcMkCev5As7XDwnj6ztg9APC/j7O1/eHwW1JYvRBun4S59t+fQCjHxCr
TzYhlEvumYoM7mNuN7lnye/aPJOzqPj5KR+xiJh85/tix21JYnQdYf/2pxH2hdFtSWL0ge4Pgy4S
ow3Cx+PSSAY6/9h0yKaPnxsMRcZkeHLPYnZt3snvavh5Cztuy+F8kn46uh8MeuSsuo6wP4xuK+D8
s6bRtn6SGG3g/JNxsOO2JOXq6yCgJDDvH5MG2XRRckDCUAh3n/xAm19yFhU/P2HHbTli8pzuC4Mv
EKPrCMeB0W0FYtMI+/raoBx9Pw52dJEYbeBrO1wayUDnH5vOpkyXaOzwzjcMeWPRR0Nyz5I3KSEJ
9AubNMRe/Lb0HLG6IBwHRl0saxrpxxPWzqrv0P3D+jGEjwfGyqRBNl3UXFBkSIaVeOYj5/8E0fNg
0hDOpzpt6bUSqQvCxwKjLta+Y3eEtWP0ge8PQ0fqg/Q0yOaHmiOKjMnw5J4lbyqxemTJXzF5MJy/
feAbm7/D+uE0shI+nsrohwlrx+qH/REQSCf/l1Q3ag4oMibDPc+EXwg9zyYNsfla19MFYnRB+Fgq
k0ZH6wPfP127/fqOcBqbI53a2IFz7p33IkOb18Q4qBpF6JnHjxWTAcKaPjG6QNd2hNPImk66nx8Y
o+3Q48DgC5Wrr6MHlJMG2TTBZfYudZExGZ7csxT5hdDzEwxJY0yeC2v6WN/85yzo2gBGXSkcx6dc
/Rj0NMLaldEHYaHYNMimDy65d9mLjH54iXfewfdLoudHP1bWPJhVD+i+6YTjhIWyppF+PHpAehwd
PU5YP4bw8cAYTiM2HbJp4l3momxR9NGQ3LPkTUpIgnD+KxCT3/T8qQvovumE/dufRrpv+/UdlTke
nXAcGHWx2DSqiU5r7PDOecn1SYaXBAKzW2Lx8C+srxPOMD66Lwy+QIyuI+zf/jTSfRHgB2bVduhp
hLUro+/QA2LTIFUErn3++hd9zFOSMfIOvl8SPT/5xqz5Ts/TMOiaWXUdYX89ICaNdN/26zt0f99Y
rnZYXxcrJx1SpRTlg2SWwF5JJjG7ijWBnrf8WDF5UPfzjTGajvQ4ekBMOunafmCMtkOPA4MvVK6+
jh5QThqkSsB1z1/7oo95SjJF3sH3S6LnJz9WTJ7Logf0tNMJx4FRF8uaRvrx6PrpcXT0ODD4QpXR
Bro+CMfZfOj8YSxF18d9zO0m9yzmo7toRdYEreEJB+wkY/g+YXRfGHyBGF3g/PU4MPoBMWm0rZ0M
dP5Z9YHuD4MvUq62HgdGtxVIj0OqnpIskcwGfqDNK7mPKnp+cjEKRt1PR/eDwY+cVdPh/PU4MPoB
MWmk+yIgGej8s+oDPQ523FYgVhukx/EDnH9sOqRKQT7I54Wij4bknsXs2ryT39XQ8xYMBaPz8f18
dF/suK1AVs1i0uMgIBno/LOkk+4Lox+QVbsYPw523FbA+cXop8eB0Q+ITYNUESVZIpkNSgKB2VWs
Cfz85GIUjM4nS77TfbHjR86qWUw4Dox+gPPPkk66HwL8wKzaDuefjIMdtxXQfdNJ99cDYtOoZjq3
saPoIiSvh3J1cNHyH0P4FxWGpDHm4uu+MOgCWXUdYf/KpJGuXxk68vykszHSIJscRdcfHwu7yT2L
2S2xeGTJ3/DJmu90Xxh0gay6jrC/noZ+PGHK0Y9BPx5dG1RG36GnE5sGqWKKskgytyT3LHlTiTWB
dfEc8hGLiMmDWfQc5eTtcBw9nfYdu0PXBrHfAf5+nEiRFGK/g348ZLOh6Nonc0hyz2J2bX7J72ro
+cmPkTXPhfV0gay6Dl3f0f400rX9wPTj0dH9dZFytMNxEOAHpsfZPOn0nh3JS5Xcs+RNJVaPLBc2
5uLrvrpAORkrrN/+NMK+MOoiMfoO37+y2nocGHWx2DRIdVKcQ+YvWSuTZy2XSTOXFrZZS2X63OXS
0Nic99Lx85OfwWLynK6nC8A3Nj+H/cNpZCV8PDC2Xz9MWDtWP+yPgHA6hJSSzBYlmSSfnfJ/gti8
5TkkDbH53PcNR47N2+FjgVEXa9+xO8LaMfrA94ehI/VBehqEFOeQpSvWyxSlzjL17eWyem1D3ksn
S/6OyddZ9Bwxuo6wf3o6WdF9K6Pt8ONUTj/sX7k0Nhc6fYLSAiVXKH8t83+C4MJmyWxZM0BWPaD7
phOOExbKmkb68egB6XF09Dhh/RjCxwNjOI3YdEh1UsgGufwyfc5yefq1efLgC2/LT696Xm55eJo8
Pf4deWniQlm2Yp08+vIcmTJ7WS5KHj0/JQ2xea4tPUesLgjHgVEXi0mjHO0YfeDHwY4u0n5tR3oa
semQzQ0l/+R307KOnrdgSBpj8l9Y00f3DRP2h1EXikmjXP0Y9DTC2pXRB2Gh2DTI5kCNzFm0Wp55
/R159KU58uvrXpa//WeCPPnqPHn+jfmyZPk6eWXyQnluwvy8fw49/yUN4Tyq05ZeMTG6IHwsMOpi
4Tg+6fo6WbUdfhrY0UXCxxMm7F+5NDYnOn/OjtIMkt8tsSZwFzV5YV2MglH309H9YPAjZ9V0OH89
Dox+QHqcJOl+CPADs2o7nH8yDnbcVkD3TSfsD6MuFJsG2VwoZIqDdx8mnzhtF3n/cTvKVgN7yXH7
byOfOn0Xed+xO0p9fa3c9/QsmTB9ifXV8xMMBWNMnnO+SX/s+AIxuo5wHBj9AOefJZ10X10gq3Yx
fhzs+CLOL0Y/7A+jLhSbBtlcKcok+exk805+V0PPW36MmDzo+2LHbQWcX1ZdEPaHURfKmoZVCPra
0NzHIpx/Fn2H7g+DL1KudljfC0iJQzZvCvll3OjB8rFTx8qHTtpZRm3dV/YYs6V8/JSx8uETd5JR
Q/vZhpDHXp5rfdPzX4Gs+c3pJf2x4wvovumE/WHUhbKm4fxi9NPj6Oj+ukC52rq+25LEprG5Uvcj
Q/7zRgPdtJ557R05fK/h0r1bXd5qwEXL/QmiX9SkMebi674w+AIxuo50//anEfZFQPv1ge+va4Ny
tMNxwmnEprMpsWpNgzz43Gw5+dBtpWf3ovJBgsxZuFomz1omB+y2tdTXFbXhIq+YP2vWNcoTr8y1
FYlthvSVpSvXyyXXvCyvT1ssr05ZKHc/OUMGD+hlfR55aa7c+cRb8ocbx8tzb8yXQ/cYLt/8/RPy
l9smyKx5K2XfXYZIt/pwOzHy5rf/+KQ8/8YC+fOtr8srkxfJMfuNNPe8+fLty56Uq++eKP97dpbs
v+vW0r9vd+t/xtfvkhvumyyLlq+TPU3lBt/h5UkL5buXPy1/v+MNuf3R6TKof08ZPaK/9T/3pw9L
n17d7D445ycPGnuN7LztIDn7ogfsEB0cw1tzV8i+Y4fIMvN9P3jBvXL9vZPl9emL5dj9R9p4V5rv
9OO/PifX3TPJDvk5ZI+hVl8HAX4g/MNxdPQ4ukhltB3hNGLT2ZTAG8EX31wgR++3TfKZSzKDbuSL
l60zPz62krrafGZBvsn9CaLnLT9WTB4Ma/pk1XSkH0c4jazpWL8I/Rhthx4HBl+oXP0wlUljUwJ1
FjzTTj1sO9ZZMtLc0mLqH0ukxfzdeduBUusyCPKK+bOhodn+TtqiXw/ZfYfBZr/J1ifwgmbGOytt
ncBElnnmuf0XY59pbBf93/Om7jJDjtpnhPzpltfkV9e8JM9OmG9f+rR1XS7++/O2EQX1kwdM/fOU
Q7eTN2cskx/++RlbT7jj8em27jRy6742L3/xV4/In295XV6dusjWu3oYfdQ3fnTls3LFza/Jvx+Y
Ig1NLbaxBv5fv/RxWbe+ScZuN9Cm95XfPCaLzXMJ99OL/+85eXHiQvnb7a+btGfJQbsPtd/3i798
RP5q0r7LfKf3HLOjjXfn42/JBaZedI05zhffXCi77TBIBph6lA7OJLYk5ZRHPQ4MvlC5+jp6QDlp
bEqgjv7c6+/IMaauWok6S+f27HAXCn9x4XJ7QfwLm49YRMzFz6LnKCdThePo6cQeu+6va4PY76Cn
ERYpR18HAX6gfjyEKOTzSii7DDQViPM/trfsvuNg+dTpu8p1F51gKgjDpbGpWZ4aP8/86B8uV373
aOlhbrKf/umD8r7jxsivvnSITDcP89IupMW4/Lli9Qb7IP/Z5w+Wn5x3kK2I/Ov+yfKdT+wnd/zm
NDn+oFHyp5vHy8Kla+U7f3zK7I+UO357mowe3l8aGptklvFHReIL79vD2r/xkb3lpv9NlvGmYgHg
09zcYj8DVIya8vuoJNz39Ey59BtHyPfP2V/Wrm+Uz/3iYfn+p/eXuy49XUZt3c/+8L3bVCDenr9S
rrv4BLnx5yfJyjUb5JaHprXqFMCXUs4kzm/oBAfQyzAMulA5+jp6GvrxEJIB5J38xxBZ8npMHtR9
YdAFsuo6wv56GvrxhClHPwb9eHRtUBl9h55ObBpkMwb5K/+xlF496uXLH9hDTj10WzlynxHyb/PM
fv/xY2w9AI0M4PZLTpWDdx8qnzF1lpFD+sjfvneM9OlZL9fdO8mGa7g8jflA5i5cbeoo+8ofzz9K
lq/aIH+/Y4J86MSdbJ3lGx/Zx74UmThjqVx5+wTpVl9n6yYnHbytrd/A/7Kbxpu60zC55VenyP/9
4Dhbl0IjGI4RL2CamgvzpGG/sSlX12gw9a5nXp8nn37XOLnsW0dJ9/paOf/3T8iJRht1lg+duLPc
/sh0W2+5/5lZ8mdTN7v1klNkl+0Hyj/vftPUXbS5TPQzGVse3flJAkNH6juUgFR/EqLzh7HgwuX+
BNEzQ9KQnmF82tIrJkYXhI8FRl2sfcfuCGvH6APfH4aO1AfpaRCSCZNX2soufp7FTm4bs+0Wcsoh
28rWg3vLNlv3tT0wjth7uB0Gg94Vby9YbWMUU6qHigDepmw7LNfzAuNt0bsE423//eBUWbe+UZas
WG97cgwa0ENmz18lD7/wthy57wjp17u7bVAZtmUf2dkcC9h19CAZavanz1mRaOQoHHeSo/cbKTuO
HGA/3/TAFBm+VR85aNxQu3/ee3aXnbcbaHueoMX8nidn2p4ttbU18uqURbZxpICvDez3zX/Ogn++
AQy6iu4fJt0/nAYhsdh8g/yW2w3i5y8/Rkwe1PV0AfjGaIOwfziNrISPB8b264Owvk/4eMKE/RHg
B5aTBtk8cXklLbvoeSln7GvqDJ8+czfrM8I86zHc5YMn7GTrLCPNZ7x4KcWl6airrZX9TF1np1G5
nhfzFq2RhUvXyRtvLbF1ljdnLLEvWdBLdIjRxcuRe56aaXvLoufJO4vXSGNjc2vP1359usmhew6T
F95cUFSncAkWJZxnN1PHQc9S8NT4d2TZqg1yuKl3gdMP305OMxvmV0P9575nZtmeLctXb7Dprt/Q
ZP1yQNvXL/2+WfD9dW0Qq2+Vgv42NPexCJtG/jOJo9MbO9IunJ55YCgYdR8d55v0x44voPumE/aH
0Q+ISSPsC4PbkmTVLsaPgx1fxPnF6IfjwKALxaZBSGp2yZCfEJzms2Zd4S2C7lsj6OXevVvh9rpg
yRoZMqiXfROx/fB+tkfJ59+7u+0S+vFTd5ETD9pWbn5oqvzy6hdtJWLB0rWyRb/utnsm9NFtvn+f
7rLcVDT8nhc+vXoWuv2hooGeLMU0NbXIug2NMsxUjLYf0d8cU39zDKPkoyfvLL261xsP+82sbzE4
lrbOXyna+dG0Qax+2B9GtyWJTYOQUkLZx+WtZP7CTsGg+4RpS6+YGF3g/P04MLgtSUwaYV8YdZEY
feD7Y8dtSWK1QTgOjH5AOWmQzZe2sorNZQknt5OMmZbn8HKlGN+3xtrQo8KBOgvqMNsNQ/2gn+yy
3UD57Ht2t8NQjj9gpHzC1FswiSqGv7w2dbH1xwsT9ECBFho8hg7ubeoZTZKssvgHCgviOdaY48VQ
XrzwcaAXCBpg8BIKw3dRZ8FLqHPPGmfrRjkVRduY0s6Nhh8HO7pIufq+nDP6YuWkQZJ0amNH6Nrp
FxaGpDHm4mfRA3ra6aTH0QNi0ihHO0Yf6HHC+jGkH084jdh0yOYNsksoy+h5yTfGZDmr6UXQFQb1
72WHmmyzdT/bUwQbGjz69upmKwTH7LeN/PCcA2zXzv89+7YMGtBT5ixYbR/uAPalK9bJ9iMG2F4j
OZJp2cNRkh/Qt4fMfGdVfi9HfV2NHaKDccJ77byVHXOLDW916ornPMkDXf0chtHj6CLl6vvAWLk0
CMlKOD8WiMl/en7VBXTfdML+7U8j3bf9+g7fv7LaehwYdbHYNAgJYfOSl5/8DBaT5fQ8rSvstO0W
thfFtsMKdZZ9TF0Bc4hgvjD0usAQ3TEjt5B7np5p/dHTYvmq9TY+GjkmTFsiI02dB3UNDf14UF/q
Ies3NMrrUxfnLbk6C17a4EXNHqbu5Oosu++4ZXBOB007jZjzEzr2NMJxwkKxaRCdTu/ZUYyeEWBI
GsMZxiesmQTdoN5esErWNxR3h0on/TgQ4Aemx0nStn6SGG2HHgcGX6hc/TCVSYOQEHp+gqHGDknB
m4Npc1bYJWqLe2ykkqJZikv/pINHSZ15WD/16jw7kSqGqWBSsamzl8v5v3/Sds/ExKGoIOAtivPH
knOTZi6Te01lora2tnVoyu5jBtvxsFiD/6K/PVsy9CTJCQeMspOTYeKxybOWyvf+9JQ9hjOP3F5e
nrhAXp200KZx84PTTHq5Wd6L8b9rOu47J4HBF9J90yk3DiEdgZ4fYUgas+bBrHpA900nPY4ekDWN
trX9wPQ4OnocXaQy2o5wGrHpEBJCz0s5I4amoOcnJkx2DQtZ8DVhSBqtxfyDDb0lxozaQh54drZd
sQ4Tpl/+7/H2d9JP//6CnTtj/JRFMnfhKtluWD/pZ/zHblvwR2+P2cbXLUSx105D7PCUF95YIL+5
7iVZsGRtLlEFzEmCFy//e26WrbNcesMrctfjM+SwvYbJ4hXrZLzRRp3l7idmyvX3TvLqP+47xKD7
+8ZytcNx9IBy0iFhOnU1FnRBci1y7qJizDgq+G++tTS/LZFdtx9kw2Iuvu4Lgy4wY94KO7nOLiat
0i7fGuHj0NOIOXZQjn4M+vHo2qAy+g49ndg0qhWuxhIPVmOZ4lZjyXfFTOSnFvu/jBk50PZ0cOAt
BXpMYGIujEPFGwtUJnbcJteogAlL0fMCXTlBixFB90nMSp5Dz8voibHjyC2sJkAXTTRUoIIyHZWU
1RvsbOcYW4sGFzRcYCws7on77TpE+vTsZioaxn+28Z+Dycdq5N1H72DfkoA9dtxS5i1ebcMwIdgO
2/S3FZMhg3rL+oZme8/EZ4DviBnLoTVz3krZdfRgW5nAPB5b9Ospr01bYu9/W27R084z4laaSS/D
Orq/byxXOxwHAX5gOelUI1yNpf241ViwWhKGlRXnLVTuH395rq2zLFu5obWcgpg8qPvpkbNqOtKP
AwF+YHqcJB2p7dDjwOALlauvU7k0qhGuxhKPW40FlQq3GktpfsLwj22H9pdhW/VtXa0FL2nWrmuU
WeaZjQaGwQN6Sr/e3WQ381wHGOa6hanjuFVPUIfZ2tQF0AMjB3T8TItJQrczdZvh+aEjeE6gToH5
PqaZusPCZWvlyH23sZOoY0gLVqrDfBkYmou6TG9Tx7H+5vcd6hqYfP0UU4d1xwU/DNHFZKaog+y5
05a2LoV6COpLqAshfcchew6zE6+ijoNV6z54whj7XXE+xk9ZbMNQVznmgJGtdbrS85cFPQ4MvlBl
tB3hNGLTqUYqvRpLTQvWPdrITDOVhkuvf0W+96n9pK8ppMWgBW/izGVyzhm72n10j8KvlLOO2kH2
GJMrNGnomUTPOcW+eLOK1Q+++P49bAEMkZ5xfWIzbczxg01DH+gBsfqbAxi6cMFlT8nvzz9CBtix
iKQt0FPi7sffsuW3eOxnDj+TxeS7Tb3MdI5+WKRyxw/8wFj9zQE0BP7FPN9+fN6BdugUiQO1JPSu
mjRjqXz8lLGm8lXoFPvSpIW27nC0+SGABs3/PjVTPnXaLnaOHkzghzekx5kKeYhyyg8m50Nv1A8c
PyZvDdPR5SfsrwfE6gM9TmX00/0rk0a1846ps2D1jMu/fVTKMqCkGDRC3HDfFGlpbpYzjxhte3IW
8DNYTJ6LKS+gcmVGD9g09MMilTt+oAfGplHtoJHrj/96RS7+3MFeO0E5dOowFv/i1thJaPqZyhjG
h+Et7QWf3M8OLbn90Wl5nzCaXm7zKSfz6nEqk0a6vk6MPojRDx9PmLB/OA1CKomfpZKW2Hzt+8JQ
I5dc85Kcdf7d6rZkhT/zeQj9WHJpaMQee0fqA98/Xbv9+g49nVh9QmKw2askj70yeVFrwwPqLRd8
cl878TDGlqMXF1ZaikPPxMXlBxVBvD1ti9jyE0Px8SQJa4ePJ4wfp3L6Yf/KpUFIGjY7JfKUn8Fi
8lyovNz68DS1voLt1oen51wzkF5mfGKPXfeHsf36IKzvEz6eMGF/BPiB5aRB4unUnh3fP3s/2208
R+5q//ral2T+4jXy668eZvfBm9OXyK+ve1m+9uG9bLevh1982y6vtGptg3z5A3vKX2+fYBtJsAIC
xrKhiymWXfrvkzNsNytMnPO1D+0tvXvmZgnWKO7ZgS7q3/rDk9KzR52sXttoJxI8cNzWcu1/J8nX
P7KX7XaO4TZ/vW2CfPsTqNgUuqyC4jT+9b8p8sAzM2Xn7QbJjLkr7HKTF557gNxk7OhSjlUTLvrs
QXboDLrA3nDfZPtjCV3cjtxnG3nvsTva7/PZnz9kj2uR+X7o3oPuyB87ZaxNA90HsXQk2LChWX72
hYPtjMUYY4d5AXBeMHQI5+tdR4+2S1Q99tJcO9atxhzsomVr5asf3ts2Lt1mbojQ2nZoP1mxeoN8
+YN7yg75Lv0hwgU1GMDCnQJ7dsTjenZ8yZTfnq09O5KZLCbP6b66QDl5uSPLTEdqF6PHUYzGFCu/
sb7D5gJ7drQP17Nj8oyl8rFTx+ZXLchlODwv/3zLa/LdT+4ne+20pa3TYGK/K8z5fuzlOXZivS23
6CXvOmoH27Ub12LOwlV22BjqKX+/4w3Ze+wQ+ehJO1nNb1z6hH3+4tmL5/al/3rFDrUDx+y/jX0+
oA7UYtJAXQR1BAxLc2As/d/+84acccT28uzr79jn+8mHbiefMMe9cnWDXH//ZHnN1F8wYTKG7H3J
1KEwVO/ZCe/I1Xe+aVdUwLDAbnW1ct57xslBuw+Vmx+capfGxnfr0b1OvvnRvWVE61C+YvRC2KH3
F0NH6wPeX8KwZ0c8rmeHuVnIGUeOtvX80vwXm+d8f12gcuUFhMVi0onVr9x3qIx+7PGDcr7D5kJV
9ezIZQK3hdne/NjGj3KMRQcYX3/8gaPkki8fat+goL1mQ0OTnHPmrvLzzx9ix74/8Nxs+xD/7qf2
k6fHvyOvTl4YlbHQMIAKwE8/f5Cce9ZueStwIrqYlsbCZevkYFNhwINg19ED5Ud/edaOZfvllw+R
2ppaueWhaXa83IKla+SLH9hD/vSdo+UL79tDnn5tnm2sAWh0QcXmF186VL53zv72O2GSQRwnKiZX
mDjYhg/pI//3nwl2qalHX5xj17y+4rtHy+fet7udjwRj67B29nX3TJJPv2ucDfvWJ/aTf9z5hrw1
N/emaPY7K+W4A0fK7795RGpDB75r+JyGz0/MdSAkO8hYxVuBmDyn+/rGcvJyOA6MulhMOmG/9ms7
9Dgw+ELWN/85C+HjgVFXCschpKMoZDg82884YrR96YINk/ChwQCNC/ub5+9xB4yS33/jCDl631yD
BF6sfMbUKbCSwW6jc/OR5Uhm4tXrGuSaeybalQn+eP6R8qNzD7SNJhhGg7l19t55iLUXN3RYjMyK
1etloIl32beOtPWi683zfsa8lTJ/yRrZedRAYz9KLjLpo0cKGl9Qfm5/ZLqdcwH1FCxDjZdExx4w
0i4v+eDzb8tPPneQqZugDjNIfmDqMD56IYwtm3p5hsEX0n3TCccJC8WmQUh2kLncViAmz+l5WheI
zcu6NoAxnEbWdMrVj0FPQ9cPH0+YsL8eUE4apH10cmNHgbYuPno6ODDh3iF7DM3vgRrZwa67PEAG
b9HTvjHZ2Tyo0RMCE+mgMWTxymxdy91xoBfIXjttlV+/uZTkgbo4oePH25DD9hpuP6PHxVbm+NDd
dStTcUGFBBUQLM2ESYrQs+P7Vzwt//efN2yDRXNzs9Xt06veToyGFq6xxg/nA297MGEPGjS+96en
7TbVVFzWrG+wy0diXDEagcD6Dc327VSN+e/xV+bK3EWr5V/3T5ILLn9Kbnt4qp1gCpOvAUx65FWg
ikj7rkghtyVJj0NI5XF5Lku+032x47YCWTWLSY/jBzj/LOmk+8LoB2TVLsaPgx23FXB+Mfrp/npA
bBqEVIZCpkP+wzP4M+/azfY8rTfP3b/c9rptICjF5lfzF5PwYQnH3J7bSjAmvLSZ9c5Ku5oBQDr4
rL3lcmWhUB5q5LTDtrOfDt0TcbrLK5MW2UmTl61aLz/48zNy6Q0vy+wFK+0EhABvljG5IcDqBmiw
AehNi/0rb5tg6ibP2NUUZs1bacPsgSrfwT+ettH9YfBFytXW48DoB6THIaRjyJrn9PyJHbcV0H3T
SffXA7Km4fx0Xxj9gPQ4Oro/DL5Iudp6HBj9gNg0SOXo/MaODBd/4ltLbNdJvOEAbrWAHOHIxbqN
jRlG6xT5I26uW5kDn4v3c8RkXPhq7hsam2TJ8vV2WMyGxma54FP7yydP38VWakL6aMBBxeR5U/H4
oamAoKvp987eX/aylSjMpFxrG1nuePQtOe2rd8pVd75hu8qhtwqGp6DHxk8+d7D84NMH2O2qHx0n
BxoNGzdxfpOEvy8C/ED7nYNxCOkYsuY5PX/CoAvE5mVd36GnE5NGOdox+kCPo4tURtuBAD8wPQ4h
HU9pHsRnvIzAsI9xowfJHY+9lQ8xYdiKfDE8JGdNB0NhAJ7jaYTLgk1ZevfsZutM6DaPoTgYqorJ
4TEEeKfWFRqgU2OHvZ7xjbvsUJgfnLO/ta/b0JibP83Ewfa7rx8ud/z2NMSw4aWEj0cH/n6c3LFr
lKMfxg/Uj4eQjiUm3+l+euTYvJx+HAjwA9PjJOlIbYceBwZfqFx9ncqlQSpL5zZ2IAPkP4bAeNNr
750ke5mKxOgRpaukpMSOzFg2M+Y/J4G1xi77hMoCJh1DFWTBkjWtlZE2gbYqXjCiy+qyVRts91H0
KlmzrtGm1RYz562w/oiHI0O3VIDhLxjm8o2P7i2//foR8uPPHmSXjMLcJmNGDrBvjabOXmbjYkOv
jrTvEy6sMKoBLNxk4xPMpz5tlcliwvk/TNgfAX5gbBqaL4a1zZ6/Or+XY+WaBpk+Z7ld3i0WPw0Y
9IOMOfZ0NkYahJSByX+leXDeotX2BQLAPBjoTYkXFVhdActgu94SIfByAfGhi+fy+g2N1m6fzT3q
7ZLBABO1o97RaMpxfT16YeR6feq0yNsLchOjYn4x6G+zdV/znF9rl6TsZbTR+3Pt+lx9AaCuheGz
v/nKYXZ4DOYOgz6WosQLJ9R/cEyoQ+A4NWLLp+8Pgy4C3/brO/R0YvUJaTcmz2XNd3oZgEEXiM3P
Yf/KpKH54gXvW3OwvH4SzO2I+kwsHXl+QPo58iknDVJ5Oq2xAxlAywNYTxfdKjFzMLZLb3jVjhE9
7fBcl8wClclY9jgyxBm2ZW878dKdT7wltzw4VR58bnameIGjzG8FsE40GnMwqeq/H5giN94/OTF0
JwQmT0XFBT03/nrrBJkxDzeNGjv8Butx4w0NjvXOx6bLb657WZ5/Y74dUoOeIP959C07USo2pIs3
OBr69/S/gyPrOSWkoiDf5T+2hZ8/YdBjx+blcP6vTBqa/roNTfLEq/PkkRfnyG+vfUkmzlhqu5sD
/Fj6zmVP2eFyWfHTwE5Jonm042mLcJzKpUHIxuDxV+bJn25+zdZX/u+ON2wDwkdP2tk2DIweMUAm
z15mw2a+o6/KcvKh29pnNObuutE8i/HSA2B+DvTGfGHiAhuGebbuNc/zdQ1Ncoh5fmPuspuNHY0U
BVBIauyQ1X/ePdGETzXxJsqHT9rJzi2ywzZbyDuLTTxTh0Hvk1nz3XCUXA8SzBP20Atv2+2XV79k
G0lPPHiUDBncR/7wr/Em3jRb10ADSjHllE/fPyxQjrYeB0ZdLDYNQjYmenkJ5+XY/Bz2b38ami9e
vjw7Yb5dzhvD4zBU7qHn37YvZ8DXfvuYvDJpof2cBcj7x6MfYMyxO8JxYNTFYtMgHUfdjwz5zxsN
zDCOWcKP2HuEbdwoBpNwjt1ukG1YwA92TOCFSbNyc2fUyKABPcwP/C3tcAzHiCF97OSbWNEEYHUU
7Lv5NjBOddwOgxNjXUszbs/udbZignk+MH8GNHYw+2hIAOgKutOogdK3V709tiP33Ub22XmInZE8
OaymoI0NDQ7o3orvBbYc2Mse/9aDcsc/fKs+sofZR7pIH3OOYM6MA3bdWg7Zc3hO3xzPdsP6544H
K00Y4e2H9zfHs4WMGtrPTno6oG9P2XZ4PznKHNdeOw0xLjXy5Ctz5X3Hj5EzTYUJDUavTl4ka8wN
Zb9dhrSeL5wT933Q4GKPd6et7Dl13yEJDJ7RovuTWDB/Ciq/qAQjX5K2wSS9mGjvwN22tm9TQ/h5
FDt+pnV+Mfk57A+jLpQ1DecX0sePG0zCfM9TM+25wA+s3XccZN/mYtUnNHKeePC2tqynoaehJppy
PDrOX9d3W5LYNIjOkuXrbKMXVvEqfeaSbEx9e7l9EYPnY/EQVzyLUT/ob8oWnuM4x64X6hDznIet
j3nO4pmP5zme25h/w+VtPNu3HdbP1lfwnD5kj2H2JQaez1h1bpSpi2AYL1647LfL1nY47/Ct+to6
BVbWGbqlqbN0Rz0ld0x4I/rMa+/I98/e3/ZI3dU861GHAkNM/QMrvaAegXvDMfuNtHOFoWcnGks/
ftou1ne/XYfIf829BMe0/25DZQ9Th8FcadjfcZsBcripu4HY8un8k3Gw44vovumE/WH0A8pJg/ig
zoJVAZF3WGfJBl5mYj4cgN5WKKsaev6M8Q3j/HV9tyWJSSPsa4wtNTJl9nK5+/EZ9iUt7lv4PYLf
M/hNhfkLMd8Q7o1ptKaRSMczWMLHE0aPA4Pbkjj/2HRIEqw6+tzr78gx+4+sSJ2lc4exKOBBfNDu
W9ulXrFh8s3iTDXCPOSxvBtwGQoTdqLC4EBFARUMB3Rc40goE+Ktxq6jB9tKCxoK0DgyyFRIgIuD
BoADxw21Gyo4qJjYxociSrXRmLHP2MJkZNsO7W+Pz4GbHDaAZeAwcSnewGDuDdvd1OgjJhpMMJkp
QD1rbxOONz8AjUMHmwrSAaZSspv5Doi3em2DvYG4hhhkHLyl2d9UYgAqSajQIB4211CE77j/bjkf
n5Ivl8edH0K6KnoeDefnGNLzfziNrOmk++UCUc7xwwrLdqPL+juLVtt7ZVb044HBTzzm2B1hfz2g
nDQI6QzQgwN1loPydRasEJejxr482GfsEDnQPJvxvEZ9AKuclObtg0ydAhsaQsbtMMjWLxyoZ6BO
gLrBkEG5Zz6i46UFemi6lzql4EcCwrE50GiChgvY9jXHhbrIsK16y4o1G+wQmTX5buMTzI+wBUvW
mjpQLj00kuAYXN2knPLp+8Pgi5SrHY6jB8SmQcjGRM/TMPgZNz3/+1iVoL8eEJNGum8uAMP8hpnf
ZW8vWGl7pr4yeaG9P5b+pgqhpwGDn3D68eiE44SFYtMgG48u1bNDz1yVyVgYY/r3O9+Uf9z1pl0X
P7fNtNu9T8+yM6SjsaEY/XiSvD1/le0ifvcTRq9kw5ugnbZFg4U+wVjM8QP9eGDwhVDJQi8RdH29
7ZHp8sQrc+XdR+9ge3CESD8eP1A/HtJe2LMjnlDPjpgyU05+Dvu3P410XwQUAtHAcd+zM2V/8/0x
GfP7jx8jr09bLHvutKVdcvKZ1+ZJQ0Oz/PW21233dqy0sKP5YdXQ0CSPvTJHvnvZ03a57mv/O8n2
FttmiP42JeuxO9r+Dj6xaZC2Yc+O9qP17NDzNwx6Jo7N27q+Q09n4dK1MmfBqtbeHGk4bawShx8f
tz403dZdnpswXz5y8s62p2gx6cejo8fRRSqj7UCAH5geh5QDe3bEE+rZoedPGPxMW05etv7BOO1P
I+yLgEIghq2gJyp6nGLY7V+/f6xd/nqMqZfgZex190628wje9MBUud58xv0XL33x/MJchV+65FG5
z/x2u/H+KXbeJPRWR6/8Uso5P+nfwSc9DimHSvfsqGnBsh4bGXRX+v0Nr9hulm6mcT+jhHNOOZlK
j1OZNMK+ldEHvn/ltEHsdygnDZKNeYvWyAWXPSW/P/8IGRB4a0eSoHKOSvqX37+H9ERvKDV/hjNt
bH5O99cDY9II+6ZrY6KvVyYvkrOOHp0zGDCPxyXXvCgfO2WsnHnEaDve/pf/fFF+9JkDZfnq9Xau
n/M/sY+tSIyfslh++Jdn5CfnHZzogdbVzg+JAw2Bf7nldfnxeQfaiiSJA7UkrGQyeeZS+fipu9hJ
RfX8Wrm8HY5TmTQ6Rz8s0tWOn2TnHVNnOf/3T8jl3z6qzaGSJAcm/L3hvin25oKh5mhA9fNoONNW
rrwAPTAmjbBvujZeRGP+oI+fOjZnyHPSl/4jJxw0ytZb8DLn+396Wj580s6y325D5Gu/eVw+++7d
7A9hvMy5+G/P2+F/Z5+5az52jsqdo/TvQCrPdFOX/eO/XpGLP3dwYgqKcun0YSzILMkMgx0/Bzm/
mMwVjgODLhSTRrq2L+L8s+oD3x87ukC0NjY1jg3Jb0li0yBko6LmTxj0TBubn8P+MLotSUwabev7
FPtvP6J/oqHDgeF5GP+KOYgO3mOobNG3hx3mhh/B248YIHuOyQ21Qxd3DAlEzyIQc+yOsD8C/MBy
0iCkM3A5OJlfW612r5hy8nY4Dox+QEwaztf3h8FtSWL0Qbp+Eufbfn0AoxIQ9Cek83H5OZlHsaNn
Wt+3bXR/l4YfGJNG2BdGXaTYH3MBlTZ0AAzNxdA99LjfceQA2+Nj9vxVdtLSPqY+c8z+o4xXja2v
YGjdixNzE7K749GPSSfsD6MfEKtPOp9ObezwM4uee2IzVXpGDKeRNZ0YX0c5/n4cXaTs41HjVC4N
QjYmepauXH7W/WFsfxphXxh1kSh9t+X9MS4WS1eu39Bse8IUg+UuGxqbMms7wsdjU859LCE2DUI6
nUSeDefrrlR+0o8nrJ1V36H7h/VjCB8PjOE09BBCuiopeTkyM6eXGZ2saaRr6yLhOGGcP17U5Oos
Td5QKYRhdZdytPU4MOpisWmQrkEXmaBUz1jhjBgm3b99aaT7IsAP1OKgS+ysd1bK6nX6GtJ+Gtm1
0d1r6uxl+T0fLU4BPaDUH2+DMe9KxTEnpmXlKmmeMVMan3lO1v31Klnzg4tkzXd+IGu++0NZ+7NL
ZP11N0rjK+Olef58rF2Vj0hIKci0fn5Oz/864ThhoaxppB+PHpAeRwddZhctXytNTS3m7zqZs3CV
DNuyr31rMv3tZbYrKcBf9PjYx04MnY2N9R0I6VqE83YMHV1+0v38wBhthx4HBl+oXP1iFixda8fp
a/qgnDQcmP8Jc7N0FJg/B8MNS1nf0GTngMNfsrniZ9pyy0s4jh4Qk05Hajuaze+kJSvW2cYNzAkz
ddZyU1/pbVefmmvKvltKH4sxTHxriey9c27hiiykH0/lvgPpOnRyYwdyTjhjxdB25vUDY9IoRzsU
B5Pu/ORvz8nrUxfbHxe3PDRVpsxeFoiji4S0n3x1npz704fzewXSjieXhh8YivOZix+U+56emd+r
DC3r1knDo4/L2p9fIqs+fo6s/ODHZe1FP5P1/7hGNvznLtnw71tl3RVXyprvfF9WveeDsvor35R1
V10tTeNfN7/k2OhBHHF5OY30OHpATDrp2n5gjLbDxjF/UYHGZF7X3ztJfn7Vi3LcASPtGNfD98ot
7fab616Wmx+cKn+88VU7KSHCs7AxvgMhXQeXeSuTtzuy/KT7IsAPzKrt0NMIa1dGX+Sa/06Sy24c
bz+/PHGh3PX4W/YziE2jlEuvf1lue3hafq/y3PHYdDn/0ifyewXQ0PGLf7xg/5LNDWRaP+NWqrzk
CKeRNZ229X2yajtcGs1NzXYhi6vvniiX/3u8bDWolxy5z3C7ItT7jhsjP/rLs7bOcsUtr9m5H99z
zI55hXTSj8cPdMdDNm06dTWWI/dJrsYCYjNW2B9GtxVw/lnTaFs/SRZt9Oy464m37JJ0WOb2wr88
Jztvt4Vddi6H084JvTV3hVxjCjx+lPTr0z1Vf+rs5fLUq/PkE6ftYvfTj6eQRjHpcUT+ceebst+u
W8u4ogkM20PTzFmy/g+Xy7or/y6NTz0jNb16S/czTpUeH/6A9Hj/e6X7u8+U7qeeLN1OPE7qD9xP
amprpfHp54zvs7YHSONzz0nz23OkZcUqqendW2r69skrb5pwNZZ4WldjGTc0sRoLSMvLGrFlxvln
TSfsC6MfEKPtKI6DyZ323Cm3TGWdKTu7bDdQTjpkOztzOe4nKMcYN9vP+GFcLPJdfV24Hdxp68cE
ox8Q9icbA67G0n6wGgDOY/FqLCA2bzt/PQ6MfkBMGm1rJwOdf1Z94PzRu+KqO96UrQf1NvcQLNXv
i0RrYzP/XH3Xm7aRdpshxUto21B5+rV3ZO26Rjn2gJFy4/2T5aHn35azjtkhmM6fb35NFi5bK2NG
ujpWGKwqgmWCUT/rCLDE5uSZy+T9J4zJW3KgXvyM+V4H7zHMrqa3sWlZtlya574jzdOmSdNks41/
TZomTS5sb06SphdeksYXXpaml19NbA0vvSLLxk+UPepWSO20qcl4bps6XZoXLZLm2W9Ly6rVIhs2
iHnQSE23zXPCZLcaS435r3g1FhBdZlL9EeAHxqQR9oXRbQWcf1Z9UOqPusjhe4+w83OM3LqfnGjq
LG45fawy5+osWOr7lEO3s0vvh0g/HhjdViDsTzYGVbUayw/OOSBlNZa2CcfRA2LSiNUGWfXRlfy8
nz8kn37XbnLAblvLmvWN9kdt7geGL4KHo1295pz9Zcc2HtZYyumSf74kD/35rA77Dkede4uc957d
5YMn7pS3xIOeHI2PPynrb7pFGp94WlrWrpWafn2l19e+KN3f916p6dHdPAjrRcyPswTNzdJiHpLN
M2fbnh4N99xv48K3ps4UCBOvbucxUr/3XlK7zTYiA/qnfqmWpctE1uS6w9X06mXijJDakdtI7fbb
SU3PHta+seFqLPFgNZb/YjWWD+zZOgdF1vJYTGyZiUkjVhvEfgfdv6P1gR4Qq086Bq7G0j5QS8Jq
LFPMj9SPn5ZbjQV0dPkBMWl0tD4o9sfLlYv/73n52of3so1ApcRqAxfnm5c+IYftNVzedZSbcLkg
hp5oS5atlZ9+4RDZ0NAkTc0t0rtncu6hYj73s4dl9zGD5fPv2yNvCYNVRXbedqCtn3UE/7jzDbnr
sRly8yWn5C05UC/+nfleX/vI3rLDNgPy1o6hZdUqaXzyGWl44UVpem2CNE+dJi2oB2HsgKlj2Qyv
/DSwPxcCPxkaTdx6NF7k91VcfQ4XGQ2GNbWm3tdH6nbYUep231XqdxojdeN2k7oxO/h1vyrDrcaC
8xVejaVtwnH0gNg0Okc/LNLVjp90DJVejaXTGzvK+RKxmRdkzcDpfnpgbOHAg/m8nz0knz5rNzlo
3FA59nO3y7c+sY8csfcI+dO/x8ukGUule/c6OeOI0XbSnX/dN8m+lcDbk/13Gypf+kD4gZ1r7HhR
zj5jV3n0pTmyYMlaufw7R9nWz7Xrm+TWh6fZH4WYoBCtoqi47b3zVvLW3OVy3T2TZMbclXb96313
2cpWDOCHniVf/tWjtuV09Ij+cv8zs+Rz71UaO8zNu2XlCmlp0OYiMScJDRVLl0rDE0/JhhtukqYp
02yDQs3AgVK3p0nri+eZB56pYESc0OaZM6Xh4cek8fmXpGnGDGlZstQcw0qRdeulBcNbmtoY/4oG
EvdQxUPe+XfrJnXbbyt1O+4gtaPNg2iXnW0jCBpk0CiCHiTS2/zt3j0+A7QBGzviKW7swGRVsYQv
Yfjaxlz2WP1yspQep3P0QTlpkI6BjR3tA7Uk29hhzuMnsPRst/gfYh1ZfsK+ldEHz70+X/52+wQb
b/TIAfKB48bIFTe/JuOnLLJj6UcM6SOfNPWOv976um1Y+N8zs+0qCUftM0K+a55nP/3CwbZ32XRT
//vMxQ/JNz+2jxx/0Eh5YcIC+fV1L8nAfj2kf58ecu67d5Pfmh/9GM6Bl2ED+vaQv3zvmERvGtfY
8bMvHiL/958J8sz4d+SvPzjWHstlN403j/FmW1/67HvGyTV3T5LHX55jG8FHDOkrX/ngnrLzdgPz
Sj5o7BgysJfMWbBaFi5da1e4+vYn97P1JfS++PlVL8gikzbyxAHjtpZPmjoUnjkYQnzVHW9Y+9sL
Vso/LzrBHsOyVevlJ399TuYvXmu+T73NO3MXrpZbLjk1n2KO0saOd59/t+w2erCd3+2MI7aXHqZO
iGXEz//4PlYXQ3f+++QM+Y45tlFD+9nGipbVeHFjDsB8f9lg6kCY18zUhZpnzbb1o+bpM6TxjYnS
9PqEXH2nezfbk9a+2DF1GVufQU+LulqpHVLSs8XYavr3l5oe/kugNesaZcKLU2XP7QaEewXiJdWy
ZbnChLqZOTZ7fDjO9WZbu87YTN3RhON46nYZK/WHHCzdDjlQakeNlNqBW0hN3765OlsVUNrYUV8X
VyA7pMzj2qxbZ/NSTbOpCzcq9WfUl3ENIIae1KY+7ITb1C9B99dFYrVBOE5YrJx0SOWpqsaOH366
0LMjC+mZUA+Mybix+uUUCsRBz47P2saOcXKQeVjmGjv2tQ/7P5iLe+1PTrRdeKa9vcw+7LC2/6VZ
e3aYCtklV78o3zZ6Jx2yrfzdPHzvfXKm3PTLU+wD/4b7JhudA2T4Vn3k9kemycPPvy1/+NaRtvsk
HqZo+MCDGGNKv/rhvWz3sbMvekA+867dbDfRe4wWxpVqjR2NL78q66++VloWL85biqmxjSDoztiy
aLHUDhsq9fvuLfV77SF1++1r/7b3IYaHZdO0adI8aYo0L1ggLStW5h6gKdhhL+aBD+wDd+kyE2+5
ib/Yfo/mBQvNfn4yMfQe2WKA1I0YLjUjR0rdqG2k1vytHba11A7dWmpM5aB2kKlEtfN7sLEjntbG
DlORRQNdVsJlOFy4K3NPqYw+0P11kVhtsDG+A+lY2NjRPlBLam3sKOrZkYWOLD/pfnpgOWUTcS64
/GnZb5ch8m5TD7jb3GsPHDdMlq1cl+/ZsbftWg6+8bvH7VxkPzz3ALsspGvc0Bo7thveT359zcvy
mXfvZsfivzp5kfktVSO77zi4qGfHDla3GDSGLC5p7PjTd4+Wv//nDVm5ZoN8/SN722FHzeYH/djt
BkX37Fi5eoNt4MBQvx9d+aycddRoOWq/bWxjD54veJmESUx/c81Lctjew+XUw7aTfz8wVY7cd4Rt
iPieOVf48frj8w6Sv902wTaE/Oorh9oXSZfd+KrtEXPrr9MbO074/O3yrqNHy8dO3cU2tKBxI62x
Y+0vfi1Nb0w0mbVZxNR7mhcvsXWX5iVLc40L5iLaFzWDB0vtiGH25U3dtqPM3xFSs7Wpwxh7zcAt
bKMCGj5ieMfUWXDeLv/2UTKgbxtxm5rsMJaW5cttDxMcZ/P8BdI87x1pwV9T50L9rfmd+XYDdaNG
Sv3ee0rdbrtK3didci+ftvJ7Em1KFDd2oPdScWNeW4TLsB7QZplvbpHmN9+U5tcnSPPkKdIye3au
x7RtPCsBeaNXT9uTumbUKKk78ACpP+RAqRkQ1xtJPybf2OaxK8SeH1BOOqTjqHRjR5ebs0MDmTA9
8/qB6XEKOD/dF0a3FciqXUxxHFSc7np8hl3xYJsh/eSfd0+UQ81DfdwOg+XpV9+x5wYP2cPNQxRr
Tb+zeI08Y2xHmPM1aIA/ltNpY5ti5+x4Ry7+/EE2bJ6J+79nZtkx+q9MWiQvTVxgZwLHGFdMkArt
D5wwRvqYzIR5Im55cJo8b344oifJ/rttbcfkPvDsbFtxwbXCODqMpdXm7MDYTUwo2jTB3DRnzCrZ
ZtpeHegp0eMTH5Wenzlberz33VJ/2CFSO3xYRbos1nSrt28j6nYdK/X77yvdjHa3o45I3w49WOoP
Mjdrs1n/Iw4322HS7Ujz95ijpPtxx9i/tlHGVAwwvrR57jxpeukVaXzuBWl84im7NTz6hDQ8+LA0
PvKYNL81wzbs1OItSM/4sbecsyMeO2fH7GW2p1TpnB0axeXRRw9Ij1PA+em+MPoB6XF0dH8YfJFy
tfU4MPoB6XFIZ8I5O9qPm7Njr5I5OzTSywKMfkB6nCTpfgjwA7NqO5y/izNj7gr7Y3v5qg3y3mPH
2GEjWC3hsZfnyiG7D5OhW/a2vpgIGUNa3CTHqO/d+dhbdn6Nbbbu27p/yF7DZPnqDXb1J7xMwfxl
Qwf3Nj/kMedWje1Bih/xaKywFB3P0+MLc3a8PGmh7QVy+hGj5e0Fq2zDBxq/33/8GDv3Brjb1Le2
Ntqo07QF5uzYY8yWcuz+I+2cRo+b77duQ5NtgPj3/6ba3h5PmTTQgDFj3krrg/rQwP495PIbx9u6
FRouUEE//sBRtjcthsWgsQS9VLAS1pRZy9ucswPxMBGjG9IyedYym96hew6zDZbYxzMPDULQ3fDP
66TxpVdzL2jMj9TaLQbY4bjdDtxPuh13rPR4/3uk+wfMdtYZ0v1dp0v3006RbocfantQoDGhdsvB
ufnOynhZgzoLzhsafdqss5i6nu3Ra34co8EC9ar6XXcxx7m/OZ7DpP5wUw8z9a/uxxxpX4jVbjnI
fKdF0vD4k9Lw9DO5udpMnatpwhu5HghowOnfr5BRNxEKc3aIN2eHhsv7uhuMNbkGpFfHSzM2NFw8
/3zuM7Y33hSZOUta0JhRtDW/8qo0XH+TNP7zWmm6825peuFFaUHDE14Wrt9g58hrWWU+28Yz8xcv
BBcukpbZb0vT8y9I07PPSvOLL9u6Ll4G4mVm89tzbQ/r2pL8pH+H3LHntgLh7xomHAdGP8D5x6ZD
Op5Kz9nR/l+YHUh6JkSAH1iZjKtrg1jtmOMZPKCn/Pprh5nK1JZyyTUvyc/+/kLrkpAhwtoIKARi
eSaMbd3TPMS/86l97farrx4qV//4eBuONyJ4QKPbJ8Lc23EMowFZeuB0O+FY6f/IfbLF6y+o24Bn
H5e+110lPT97jm2MqEEviPZfrMqCbp1bbCG15gGMITV48HY//RTpee7Z0vvCC6TP3/4k/f93l/R/
4gHp/cffmsrDe20DS/O06Xay1A133ytrf/cHWX32ebLipDNk7Q8vkqaJk/PipLNJL4/JMuNIj5Mk
3a992g49Dgy+ULn6YSqTBiHVSsXKj/kx1DJrtjTefIts+N0fZf2FF8mG/Lb+Z7+Uhn/8U5pefElk
vasjQCRCPwXfv0Y+ftqucvaZu9mV2M78+p228SNEauW0SLu5qcX2KC2gH6j9DvnPIerqauT0I7aX
333zCNsb9oPfvde+NKgEGxqaBavo4Vg/fuouto70vXP2k7/+4Bg596xxtvHrq79+TPbbdYgNK57c
tNHUocod9hTztr/3738jAx7/n936P3C39L3xWulzxR+k908ulF5f/px0f8+77Aue+n32yr246ROe
0LHTwAurwYOkboftpX6/faTH+94tvS/6ofS//Ubpf8/t0uvzn7XDbBqefV7WXX2trP7qt2T5CafL
8mNOllVf+5asu+oaaZzwRm4YTxURLr8IMJv5vo1X/FnWnfFuWffpz8r6b31HNvzgQtnwi18Vtp/8
TNZ967vehvtK47//Lc1vvSV1hx8qvf7xV+n95MPS+6H7pPe9d0rPW/4lve66Pbef3/o8jO1+6fnT
H9mhTY2PPSFrv3a+rD7mJFlz6rtk7Qc+LGvPfK+sOup4WXf+d6XlnfnqPSW3JbFl3Tenkh5HD4hN
g2zadNnGjvSM2/7MGy4cYZHYwuH7w+C2JLCsWL3Brin9nmN3lN9+/XDb6wJvUdDwgN4gmDuqmNjj
wZuHeYtXW61+vbvblmR0qwTowYHJUvEmBa30LfnEhm/V1x7bK5MX2X0cUxAM8+jXz7bYq1t/E4a5
Lto5zGOjgxONY8aYVrxF6NtX6kaOlB7vOl16m5t9v//eJgPefNn+7X3Jz6T7KSdJ7TbD7fjTddf+
S1Ycf6qsOOO9dohPE1rTMSwGF4FsVMLlBQF+IPxjylisvmZqCz+NgLYh5tgdsd8h5I/eY2hgrTTo
oo4x7B0J9BcvSw5/w2hPvNFdZOydMPKTbCJElR873GCttCxZYrvvt8ybJy1YVWz2bPvWev03vy1r
TjlD1n/ne9Lwlyul6ZbbpPHW2+3WcO31sv7iX8ja931YVu9zkKw58XRZe475kfOLS6TxzrulGcNF
55sfGFjxIgIcv/8dcgbk//3Nj/m///A48zislRfeXGAbGODfoI3tz4OGD/jhfgBflC1Xgvr36y4L
lqyRJSvQYFNj6jvrbZ0HYDgLylr4nCbBsAD0jkBv2H//6hTb8xTzjQEMKUFjRXvAnB/d6uvs8JW+
vbrbVSI2bGi2b+jRqIIeDfvuMkSw4tW6fL0KoDcuemQAzG2Bel5L6xnITs/u9fblExpPAOZjK6YG
QwtQ/7Kbqbf1wXwKPXPDDjDZe9YT2ZVALxDUu/r0kfpxu0mvb35VBjx4j/S74R/S89Ofkrpxu9qX
Zi3LlknDvffLmh//VFacdKYs2WEXWfmhj8v662+0dS4Mh2lZuWqTq3fhiiUumzl+9Jhonv6WNP73
Xmn49W9lw1e+LmsPP1o2/Pb35n6yRmpHDJe6vfaS+iMOk/p3nVnYTjpB6g460NvqDz9Uun/hPOl9
313S88+XSd0Rh0vNwEG5fGTqujj39m8+b9WiHo/PgwdJtw99UHrfdpP0+PqXbbp2TpdBJu7QoVKz
9RAUSmn4z52y9pOfKWqUBXpeLCeLhuPYs5f7WAT8tTjoHdbWy+VyQK8wNAzjb0cx3/wuw/QDpeCe
i992mDphc6dLDmPRM6+ecUEo82qEfWHURWL0Hb5/wYD7LcZbYhgLJg69+q6JtisiHpr/fmCKbZB4
Y/oS25vikD2HyrCt+sh9T82y40gx+RMmAgt9B3RrxNKznzw9t/TsVLP/5Cvz5MyjRsuoYf1k0oxl
5tznhqmgKyi6oe6y/SDbiPHGtCWy2OzfcO9kWbuh0XbNROXmrbkr7dCWlWsa7Bwfi0ylBxWJSi09
Ww3UmMpErbm515uHLxo70E20DivCDDcPAFPhaJ46zfb6aHjwEWnCzOfLV5hraCqKeGh0S84xwWEs
8bQ1jCVcfvWAmPIO31B5TNPXQ3T0NFK0Y8QN4TgwKgFB/xwf+f59suPIAaai38sOg0MjLsaZt5dH
Xpgjv7n2Zdsg3FF88ZeP2u71xV3eN5gfGH+9bYKdPHqPnbYKT8LXReEwlvaTNowlqvxgnoJXXpWm
h82z4J77pPE/d0iT+UHQeMdd0njbf8x2hzRed4M0vzlR6sbuLPXHHC31Rx8p9Ucebn6IHCp1hx5s
57lCWM3wYbmhB2g0QSMJuvn/9x7bGwRDLZvR4FFbZ+eUamuoqH/8yWO/8rbX7TlAPsIP/rOOHi3D
BveRCabeMD1fmd/S/LDHxOgo65j/C/Tv213mL1ljl4tFIwBenOBefeiew2WvMVvZMAxZWbFqgzz0
wts2f+KlCyrwr05ZZBsIsCw/npcObRjLcQeMkjsfny6vTlok0+Yst8d10sHb2vnJUN95aeJCG3fw
Fr1SV24pXXr2f+b+hQlITzxolLH3lJsfnGqf0a9NXSwvTlxg5zXD5O3PvTHfHjMagSbNWmbrbxjG
gsaXOx55S2rrauxwZMz7gu/6gROSc56VDmO58X9T5HBTL8SkqqC30UPdDnN6zV6wyl4HNPC4YSyd
SdQwlnaCuSIw7AbDjXucdaZ0O+ZI6YahyHvtKXWjtzd53fzQNj/Om6ZMzdW57vufNDz1tDS9/obI
mrV2qAV+wAcK7EajrWEsdrfYhDnvUL7/frVt5Gi69TZpfvlVaZn/DloNpf7ww6T7uZ+Wbl//qnT7
8Ael/rRTpf64YwrbSSdI/Zmnt27dTB0VW/0Zp0ndwQfaHs25BJPH4cDxaKcME9bWHbC/dDv1FHOv
Mtfi/e+WHh/7iHQz16Z+333sBLRYbrje1IvRGJKmH0PoeHL68WlgnkKUp9133NIOxVtqfgu5stce
Jpo6w3cve9o+N4YMyg2rqzSYOwi/GTBPYzH4rfePu960dZmYuey6AlW19GzxBKXhTBjOnTGFI1Y/
Rtuhx/GNOOOvTF4g2w3vbx9qGBO607Zb2AoCJuhCyz8ekBirudXAXOHAg3vJynUy1PjAt0BSH40W
eJhivg8cD/bRpRNvHHCu8TCeZPYBHuC7bj/I2vGwen3aYjvUpW/v7rYyh/G1GFqDNy2vTs5VFLYx
D3a0fmK2coSTNjA3TzvZlnnwNjzznHnwPmAfwjW9e0ntqFF2lvG67ba1y+XWYJLTQQNl0cpGWz6+
86n9pF++fLRgZuyVq3IrzGAiVVNhtvTsaYfRYN4TO7EY3uBshtgJSp+cIV/JtPRsMCCq3He0PvD8
m1uk4b/32onDur33rEQvKU0b48fnmIrxx04dm7ckif0Ozh/3iqfHz5N3H7OjvUeUcsqX75Dvfmpf
c48bYLt344fRR0/RjwHHh3mAPnTSzrK9uSemgUoIfK//6Yl5S+X52A/utz84Pv++3fMWU+TMffGy
G8fbivw579ptk2uE5ASl7QPPbG2C0qzlB0ut27H0r0+w49xbpkyxcz/hB4xd3QIrTdgfAgbz7K0Z
Okzqjzpc6g452D4nTG0vF2bJa2N1s5W5MfSCv2tWiyxcJM3T3pKmiROl8eln7bLqWE4djSPdPvph
qdtjnHfQ/nfQvxTeEKLuBjC3BubvAnhrOXv+KluZxo829Kbo36e7bDusX6u2rUNMyfUO3WFEf5k+
Z6WNDx38qMCPPvR2QI+JXbYfaBsj0CCAZfdRFzpo92GJ48R1wNCS3XYYZOf8WLJ8vewzdivb+wST
f6KnCRpZ8AMDuDoMKs27jh5kjy8E5jLDfBuon9l9c6/rXl/XWu/CPhq9ABo6sFoLwBwa75hzBIYO
7iMbzDFgHjaA74Hvg3OEnh5YzeXAcUNtmANvYXHsaCRGnQwNH5jrAz1yAVbxQ4+5uQtzz/6dRg00
9bvV1qecFcgqSdQEpR0JJj9dsVKalyyR5rfnmDJg6lymvGE1GkyCioaO+l3GSrdjj5bup59qJ5ev
BJgjpfmddwo9SBo22LofXmrZVW8AGkjRQyJflnE9Mb8ewEvF1sYO86coq1tw/2h+7nlpevY5aTH3
jdrR20ndSSdJ7U47me9k8h96XJi6ZK7BIoxf1h3BgJQ4OqX+uM9hGAtWXCyurwBNG3MLPvLi23aB
BI1yv8MqU76uuXuinHzItq1lu5jPXvyQHLXfCFsPQR0Av5lCxwDw0uWIfYaba5eeh3C/uPDPz8pF
5x1k71cdwY//8qxtHLj0m0fkLTnw2/KOx6abuth+9rfmpkTVrcaS/iX0zBtT+NJ9268PdP/KaION
8R3IRsBUbLHiS+OLL8n6a26Qhkcet63eUltne4YI3hZjMihTIvGWDD+oCm+zjNF1w4WDK7YINvER
F0NsULHFW7zaYcPsWw5086zf0/xoa+Ot3qZOaWNHOP+3v7xsrPJYGgcThK2/4q/ScONNtptpn5uv
tysApWljKUS8Wfjllw/NW3KE44TFiuM8/MLbcvMDU+1DVGv0dI0deHuLN7MYsx5qnZ/41lK78sLF
Xzio9cdJCDZ2lAcbO9pHaWNHj9Q5GIoKirlnN97+H2n4/R/tBN12ac3GRjucsw5vVU88XmrHjs0N
NagpNKDU4FkAmzfkUy+frWUTB4offCYNTCLYcNPN0nDtDXboJLqXd3vfu6X7uefYH0X6PaAN/Yyk
+1cmDdJ16DKNHaWgzmXLXJNt/Ft72RXSOP41U65yc4P0+NiHpMcHPyC1Q3IrCWUBjYtNU6ZJIxou
J7whja9NsCvJ2BVv0LCB4Wm2etbSOhzcYetz+YyOECyRDDDMK1QuLCjX+B79+kq3z35G6t/3PrFD
lerN/SFDwdlY5VGPE6ePZzwaJa69+IS8JUf4eMIHWhwHPae+/Ycn5Qvv36N15ahiihs70PCI3pvJ
+YSSfOA798hHThlrl4VOg40d5VFdjR2fOSCl4uVn4NjCF1s4YvWBHycsUonjn/3OKrnwymfzewXg
irXjP33mbjJ4i00rU2+WmGKHWdMbn31eml57XZryy+ViLXqMyV28eJXtEow2ipp6U0aQGVDxLeo+
bdc3R8V29Rppwdhss9m/du168xkPR/PwxSzZWLINjR71u+0itTuMlpoBfst2K3hgo7KMmbfX5d5g
2fXx1xlNU2m2NnP8dtneLfpL3ahRUrPllubh20dq+pgHcO/Cuusbi9bGjtSlZ/Vjynqo6X4R2ngj
i3O4bn2ugmSuoQXXFg1Xjea6mbAWkx+aUKF6403z901pnjnTVngwVrbHOZ+S7ud9plUfQ8wuvf5l
mTxzma0XYZlD9Ly47t5JdggJ5t459oBtZJshfeVP/35N9tllK3nzraVyzpm7yoTpS+TlNxfIFRcc
Y7XQXf2h52bLv35+sp0jAz+S33xriR0vjuUh+/ftIXc8Ot2Or0f3bawOcN57Cw0DwDV2HL63qTxc
cK+cdfQOdnm9683xPP7yPPtVj9l/GxlmjgsVm+lzltu3vJhAGZURrHCggYrQ3/8zwa4uhaW00ZDy
3bP3s/HQKw3d4bGiFM4L3na+99gd5QhzDEtWrLONJBgeiPOx7fB+8r2z97dvUDHW9ewfP2C7u+P8
YMWqUw7bPrWx4x93vGG7sG/Rr4edg+AyU8m/6K/PyVH7jrBdSXFc3/vT03aoJr53myBPmDJr3/Kn
Z7SyYGNH+0CZQmPHVDR2nB5aejZ53VqWLZfGv18lDVddbRsvaoaPMPfe7aXu6KOk7pSTc/MplJB+
6f3ALFkFb4I3/P4yaXj4EWlZslRqR4yQnhf9wE7Abd9CYyx9t+52SdLSVS3KyYod8R0qybX/nWgb
a0trvmiMfe9xO7auIkOy02UbO0pAXanh4Udl3T+vM3WuybaMosGgbvdxUrfttlI7fKjtLduKySR2
hZNFS2zPjaY5cwsNG6Y+Zu/XWFkGK5H0MN8b84sMHGhXm8GzvBaT8KNBAqCXr0nP9vowIP9hSJL5
ZHt1Fw/T0qjdw9TfTj9NalB/iygzYV89oJzyqMdJ18c8Erc/Mk1ueWiarbOdceT29vl76fWv2KFt
6DW12+hBcuLBo+TH5tmKcvnEK3PNM3YbO5T/iptflz9+60g75O3RF+fIJde8aH8Yj91+kNz9xFty
0/1T7I9kPNexkuV1/51kpwhAT1T0mr/48wfnDiRPcWPHl371qB3ejwUbHnh2lrlnTLI9zPAy5mhT
b8GCDuOnLLK9rrC89rc/uW9rL/xSXGPHx04Zaxse0MsM9ZIPnbST7d0zwYTjOwOcm9NM3eO0I7Y3
df8aufvxt+ywOTS8oP71B/N9B5o6B3qGff23j1s7vuNqU/9DnSmtsQNTGFxx83hbF0SPMCyfjaF9
SPPcd4+zWpffNN4e39c+sldq77eNQVU1dlz4mcIwlgLpBSQLYd+wSIw+0P07Wh/oAbH6pAuCBoY1
a2X+olXyqz89Jj86e1/7w8RO7NqtPje5qzJMBQ/j5kWL7Zt/+xcNEqZSi8+2a+Xbc2z3yuaFi3IP
aYNt7AhlGvzQzjdyZAXL1tXttJPZdpS6HUfbNfwxYRUq1nZMeQeDxo578o0dbhhLgfaXmfaWR5zP
lhkz7RLMuB4YX49utRi/j+XzbM0HPzhMJclWruYvNNdrYa6xqncvqRmytZ0TpgZLCZ5yol2arxg0
WFx246v2odure728Pn2xXTqxuGcHjulxU1n45VUv2ofpeeZBDq68bYLa2HHjL062y2Jjnp6rfnSc
Hb6GuZYwRhznO0vPjuLGDqwy9etrXrY/uAf27ykvmTR3MZWZ+abCF9Oz4883v2bnJMI8RNfdg8aT
OfJnc+yoNFx56wQ5+8xd7ZsbdANHQ8qFnz1Q5i5YZd98YM4KVKTONRWbL35gDzsu/5u/e8IO+0M8
LCf5y3+8YBtT0ho70ODy2Etz5duf2Ff2HruVbdwot7GjedEiO7wN3X0x3w+Wzo7KnBlgY0f7QPEM
N3b416rF3Hcb/ni5NN15l+19Vf/ps6X+hONtQ2WI9t5j2qLpiSel4fY7pfGBh8w9fq3UHXqInRcE
je41g7aQ+qOPlu4f/ZDUjdvN3NBro/XT/SvzHUjXZFNp7HCgh23DQ49I45PPSOOkydI8Z66tM8Hu
6kgO26BhJ6bvbepiA2yPkBrUdzBfztbmuYyetBhGvNWWtnxb/wxgfogb7ptiG/7xjEjOA9T+8mJd
g/7t1we6f1ik2B9DwX7w52fknDN3s0PQ8KP8jCNGJ3p2wB/z8XzN/LDHcLHvfnI/28CAxo3fXveK
39jx+YNtD46/mjrMjz97kB16hqG8eEajK03Wnh2useP9x+8ov7r6JTlg3Nb2GmGaAbyUwVwesT07
MG/Gd0z9DEN0/nTTa6a+dbR9QfOHf71qXxiddvj2tq72B/PbGC+PMMzvv0/MsPUJ/E4+56IHbN3r
U2fsKt83dQvMf/Trrx1u9X9j6lUod201dvz0/5439ZddbVoAjRs4x5tDY4f2eqITQAlwWxJcCL1A
+YR9YdRFYvSB748dtyVxvu3Td8DoB8Tqky5Mfb1t2GgxD9SlfQeLYPnb7bfNPVwxnjswHwdWuqnb
YbTUH7Cf+bF0ovT44Puk5+fPld7f/7b0+dlF0uc3v5C+f/yt3Xr/8ALp+amP2/Xsux12qLp1P/Uk
6fHJj0nPsz8uvb78een1ja/YeFarZOv9w+9Kz4992DZ0NE6cmFsO7sKLZfW3vy+rvvotWfXFr8qa
n/1KNtxxt52Y1XbF3Gi0v8yEfWHURZw/GjEwPn/Dn/4s677yDVn3jW/Luu9daJeN3PDP66TxkUdz
52TVamlZuVqap0+3vTjQ4IXeN90/9AHpedEPpdcfL5Vel14iPX/1M+l14fe8hg7Qu0e9YLUB9NpA
Yw8aOlpRvsNHTsLkeOHvADCPDybkPHiP3Nhy9GI48eDcg7cchm7ZR4Zt2Vt+ZyopaJg6xDzg8ZYi
FvTYQEMHwESCqGiDhcvWydsLVpkK5GT54RXPyL/un2wbNvBGBOP0MV8R7JffON6+VUIPj+lvL7e9
PvBGF6DSkXWyP7wdale31A0bbIV7zTcvkLUX/UzW/elKWf0t8/nnl8iG2+4weWFibj6Gjf8+gmRC
Lz/Nk6fIhm99VxpvvlVqxu4s3X/8Q+lmynKooUO/xzhtX1/3D+P8sepCz+9/R3peeIGIeWY0mryH
t9R1u+4itQMHScMtt8m6H/zYNoqUo+8Do9uShOMQ0vGgQaL7ySdKrx98R/r8+ufS9w+/kb5X/F76
/vmP0vcvlyW3P/9B+v7pUuNj6lC/+5X0ueSn0uenP5Ze3/mmqUt9zOicYHvNosEja0NHmPaXl1Zf
z98ZvYAofaD7w6CLaP6YSB4N7/+8+037oxwNHZa8X6n/0ftuY1+S5BxKAouY9vYy29vCzbGDHqTl
1DMAjm/k0L72hQ9eFmAej3InLT0938CAOgt6dKCXKVZUwupvaKxB3QQvUTDZPnqb9uhWJ4MH9JJf
/uNFG4aXTRjejkYizIt01H7bWD3MC7TdsH72c1tgglRMwIpeKpsbXeAb65lWL0w66b7t13dU5nh0
wnFg1MVi0yCbGXg7t8UAqRuzo9QfuL9txLANGGgE+d0vg1vvX1wsvU0loPf3vi29vvpF6fXF82y8
Hh/5gLf1PPsT9gd436v+LAMeulf63XSt9PrKF+0qNM2TJ9vVZ9Zd+XdZ/Y3v2OV3lx95oqz+4tdl
/Q3/zvVs6BDaX2bKLo+LFknjXf+Vdd++QFafdLqs/dRnZP2ll0nj/Q9I01szpHbsTtLj/K9L75uu
k75PPSZ9/3e39L71Rulz+03S96H77Nbntn9Lr79dIT1/+D3p/tEPS/2xR0sdZprfblRuiJDCdsP7
yW++frjtDvuJC++3vTzsd8iHl9Kvj/7wL46DCfbQUFCJVnWANwWYdBdvT/AGAbOf48HeXrBSCsCb
Mrz9QY+Nb35sH7noswfJVRceJ8MG97Zvih57aY588MSdbJhbjaEBk8i1tJT1FiNtHhIwYP1q6XfL
TbL2BxeZ7cfJ7YILZdWHPiGrv/A12+CBrs+oMDeNf13W/fXvsuZb35OV7/mQLD/8OFl+8NGy8qz3
y+pzv2DsF8jaH10s6/90Zfp2+V9k7U9+0Zpe399eIic+cZM0/+tGmw9JLC2yxfzZMuqp/0nzpX+U
DeYabPjRT/ztu9+T9Z8+166aUGeuZ49f/NT2oNBIv8fo6P5hSv1rBm4h3d51pvT5zy1Su2OugQ/D
WXAPwgpiTeNfkzVf+Io0T5xsw9oifDx6QPg7E7LxQeNE3bajpH6/faTb0UdK9xOPsy+Mirduxx0j
3Q4/VOr339f2urO9VftVenJ+FIpwmcnKxiiPvj8M8fr9eneXC889UA7YbWv5zbUv2WEZIOBuf/xr
WP2iSI1NLamrLcWAF0fo9fDzLx0itzw4VT5z8UN2AuNKgIYL1FkG9+9ph8ugXvL9cw6Qay46wa4y
9cIbC+T//jNBTjholA1zk6quXd9kX2yFzkcaGBqTmx9m86MTGztKcmgRWQtfWkEK6afH0dHjwOAL
VUbboQekxyEkADINxpliXCnGmAa3HtbHTpDXzfzQtZOnmhsrJhAp3ey4VaPXu7ftgYIl4Hp97YvS
3/x43+LZJ6TvlZfnen5grpDBg6Vl3VrZcN//7Bvs5YcfKys/8ilpePRxaVmypAJvsFEo2l9mWv1w
PJj7BENN0MV1/gK7hFrztOnS/Nrr0ogl7f7xT1n/k5/J2k+eI6vN91l16FGy9kvmB+yd/zVPs3V2
vfn6k0+Unr/5lfR95H7pfd3V0v1z59peOLWDB9oeO3aiMWwDBuQ2fMaQJYwBNuc4y7FjiAZ6K3zj
o3vL+44bI89OmG/teLjhLUIBXwg/2NGosWZdg52YC6tBAUxohS6b6LoJ4IM3EXhAYzgHls7DlhUM
7cCGbpk3/eJk23MEqxdgEjCsxJA8znjwFmbVmg32OLESA3RRocAhYgnu3XccbHt4oBHHjd7EONtu
9XV2KUuAtyaIHwvOar2pROD84XtghYmhi2bJjg/cKutvusVs+Fu03XK7NE6aYrs+o/dU/0fuk77X
Xy19r/uH9PzER3Nv24dsJTV9TD5Yb67t1Lek4cmnZcN/7pJ111wva359afr2m9/Luqv+Keuuu9Fu
Pe64TfZ88QFpvPAnsvyI42XV175lh7a1v8xVIeacYEhg40uvyLq/XiWrvvg1Wb7ngbLzlz8lh99+
pTT/7W/SeNO/penWW/3t7ntMbXSd1JofRj1+/Uup3WEHr/Cml2c9IMs9oBTfHwazmXtK7bCh0uea
v9uG1+4f+aDUmnsOepH1+OoX7aoOxXNDaYSPJ5+GQuzxE7I5Ey5jPum+ekBsedTTCGu3pY/6xtr1
jfLhk3a2Q06wrDWGoto6S+K55Av16VVvn+FYfhrPayyF7RjUv4edAwyrrwDMb2Gf6fljipm5Ab0/
sYpSn57d5M5LT7dDRebmV1zCsCM0OrQH1FkwRHbV2kZbZ+ltvhf2watTFsrIrfvKAbsPtceOIS8A
85Vgfg707gCor60x5zEWnAvMlYLGE9RZcC1c3a8aqfuRIf95o4ExVVj/F+Obi9+MZSkgjnQ/PzBG
26HHgcEXKlc/TGXSIJse+BGINbNPPnTbTW7Vh1aQV3v3kroxO9h18Hu87z257p54O7LTjnYtfDSk
YO37DTffJk3TZ9i5Pey8FGhgiQQ9BLBs30HjhtrukY6oMmN+VLZgArIpU6X55Vek6elnpemRx6Tp
vv/Z3hqNt5ofqP+60TZwNFx9jTTe/V9pevRxaZ7whrloq6VmYK4XDdas73baqeZHxIfsJKLd3v0u
+0YIa/vrxwODf5Axx44f6/c8NcMuNf3IS3PkpINHyW47DJYVJi89+fJco1Njf9fiofjkK3Plwyfv
nI+JikM3O/HXjLkr7dwfaBhAowQaTfBmA2NM0ZDynLlnY86OPcZsKQP79ZQHn3/b5lV0iUSjSDGY
SwPzYGw7rL99I4LxrxgG8+8HpshMkw6Wv0YaWEMdY26R31eaBy0qOuidUldXuIbFYL4nNL6859jc
W2ns45g+Yr4PjhXDWJ59bb59xrzwxnyZ+U5uicuGxhb7pgRpYsIvNGrstfNWcvDuw+zwlv89O8tW
iB4z5wrdSvEWBWNsHagMYJ4SjGvFPB8vT1potTBZGsB1Wr66wZyrOba7KSZAnLSkUYbuPVZ2OPUI
6XbYIcnt8PxwsXPPtm8Pkeex4S1jt6OOkB4ffK90O/1U+7ax25GHGX8T59BDbPmp32vP3N8D9su8
rdhlD3m85ygZc/ieUtvUII2PP2Un6MOy1yhz+AFMRJoXL5aGBx6SdX+8Qtb+9g+21w2GemB1q4Uj
Rsu8MXvKlicfI/WHHix1Rx4pdfh7SNFmrlG300+Tbl/9kp20uZj08owAPzA9jo4eR9Hu11e6Hbif
Xbrc7nfvbvLK/tLt/e+zDW0a6cejB6THIdUAngO4h5562Habbp1lI4MXBVhyGWVj7HaDxC09G1Ne
0n0R4AfG6Dt0//ZpYxllDDldsHStPGyem8O37GN7MWCYKp6fqLOgEQA9QO57eqZd4nX7EQNsXAwl
wW/IiaYegUUbMCcVhn6gPjF6mwF28nVMIIqlqO95cqbsauofPbvXywtvLrDpoUcn6ibF3PXYW/a5
j2EeiIMXIaNH9Lf1hWmmbonJ3+cvXi3HHjjSTnKKSdux7DbqVRiiGxoagvQeeWGOnS8Mw0jc/n7m
++w+ZrBdQhsTvqPR4cWJC2WCyRMYgtO9W72ddwz1k/ufnmVfNGF+NJwHvFj5zyPTbX3J1t3mrbTz
SOFFUjGoy6CuhboYJlJHvQWTtWJYD+LihdD9z8y0DTo4nzPN9+lrzjeGLqetRLMxwAu850zdDtc0
rQdtVjpxgtJXWycojSl4YV89IEbbocepjH66f2XSIJs2mKH7gsuekt+ff4QM6ORJgjoKTNiJCRmb
Jk6W9f+4Rhqefd5O9NXt4AOkbt997LK5aT/AarfaSupGjhDJj5HNTVA6s3WC0sxlZskSaXrtNWl+
Zbxt5MDEgpgnwfbkWLXKThAK0N21BhOQmXQxOZmdcX2wqaDANnx4bk6VAf1tzwzYbK+YIjr6noJW
//FTF9tZucGR+5pzY1izrklenbzQ9sZAowLut3j4YaKrYt4wD+6F5mGKB9wQ85BHJeFAvFEwwN/N
izHSaGB8KH78o2FkuXkg4U3DjiOT6/vjATx2u4F2fCoaI0Zs1dc+qJ0WHrTbm4qFm9wUFQc8zLGS
1NhtByYarIrBg3+mebBjwjC3P2X2stbvgzc8mOQLKxrhAbnzdlvYHipoyMAqK+tMhQJdXNGYgvlD
hplKChpZMCs52Hpwb/s2B0N3MCeHA29w8OYJb3Nw3HirAj/0FHFg5Roso4tGEAyLwblEAw9mg+9s
WicoPWdf6fX2DFl76eWy4f4HpG7sTtLzkx+T7medaXtoVQI7wS4aDlGOsFIUJv1bbiqF+fl6Wtau
FcHWxWhZu04aX3zZ3Iues6s0dDvQ/PA/8Tip23EHW+4fnL5Gpq2qlY+eMa6NpWeTpJfnyt0DfCqj
DTbGdyCbLpvaBKVdATyTCxOU7mB/wGYltjxWrszrQuXoN5m61aSZy2SRqWsAvBBBYwDSwI9y/ADH
PubfeHXKIvs8zoXnmD1/lZ1zC4zdfqCdPBovePDMnbNglX35BQYNMHUKUxfBsxu2eYtWG5/usmfJ
ZOiYMH0ro49VYF4x6aP3BNJEgwHqHGicQn1hp1G5ug5erKARBL1M0EASahxAbwk0YGB+L9QL3P7o
bfrbFzvoUYGGGdRNUC/Cyxm8PEIdC5OPLlthnp8G2NCggsYc8NT4edLQkOvFip4n0CmdeBW9WuYt
XG1X6sSKfWicwblw866h5+tkUyfDyyEMb0EdET1ixpj6XGfP61FFq7G8Kheem7b0rE9M4QOVKeCV
0w/7Vy4NsumzOTR2tGJuP5jIE1391/3+cmk2P5Bszw67XFtK5q+rk7oxo6Xn5z4r3Y87Wp6buCjX
2PGhtKVnTXKrzEMLEz9OnmonCG1+/XURt3QvloA1Ba52mxFSO3Znqd1zD6kds6PUbred2GUZ0dsA
w3nM3xo0xLgNtgB6+a1ceU/39wN5P9k8KV2NBSs2rf31pbLu2htMvq6XmkGDpNuhB5m8Pio3Jr1b
oQw1L1jkTSzcsnJlbtlSfDblt2XpUmmaNTvXwIGyhFoFGgpRvcCWbzS0WFv8UKGOxlaFGhrtKlK9
L/qhdDvkQDusD+UbQXY1ltnL5JOn7SqYryUL4fIWLoiVuQfoIuWU/9jvUE4aZNOGjR3xtDZ2mFvJ
WUftULIaS5iOLo+6f1ikMvoOPTA2DbLpUz2NHf/K9ezI0tgRzujhElCZAqiLlFPwYr9DOWmQ6mCz
auxw4PfQnDmy4c7/SsPTz9rlWW3jg6O4UcHcsvB22Pa+MD+0MAv6shHby4xuA2XPfbe3czAU04z5
QBYutMNNrC6WljN6Nb16iWB+jP79bVf/2oMPkrp997U9OLQCGFsmdf/KlfdwnLBYOelsTDAMB7OP
L13pL32MNfg/fdZu9k0PiUNbejbXyHirrL/+Rmkx5QOrANleGMXlrpii4WW24Q9l0u6Yv6bM2UZK
lFHM8YPy5fbzfph/pKavKW926/zeLh7muOvH7SLdTzvVTuRZTKKx4/RdS5ae9dlYZdOPUzn9jfUd
yKYPGzviiW3s2Fjl0Y+ji1RG2xEWKyedjc0vrnrBDqkpZYu+PexSsdpStySdzaqxIz2T64GVKYAd
qe0Ii5WTDqkeNsvGjhLs22HzY6wVTKqKSTtBc7M0z5wtGx5/QhqffFqapk6XxvkLpXnFCqnT3hhj
CIqJa9fAx7AT9NIYspXUjt5eanfdVWp33inX8BGgcuXeN/KeQjYGWmOHo2XRYml87XVpnjFTmt9Z
IC1rTbkrrRaYDIQhWq2Y8oKJjC3dukktGjC22MI2YmD5bFvmMPkuGjjyQ802ZWIaO2LLZ+XuAZ2j
D8pJg1QPbOyIJ6axI1y+9ICOLvOx+rHHD8r5DqR62CwaO2ILRjmFQo/T0fqgcmmQ6oSNHRkxt67m
xUvs3B+Txs+Ql16aKacfMsr89ir5IYIfY7165n6s4QdZfsWTQqGrTJnU/SujDcJxKpcGqU7SGjtI
27TV2JFe1ipXPvU4vrFy2g49sJx0SPXBxo542mrs2Fjl0Y/TkdqOsFg56ZDqo9KNHeHXE51EbOGI
LRjw9+PA0JH6jsqkQQgxmIJTu+Vgqd9jnKzee3+ZPnZ/kRNPkPqTT2rdup1ituOPlbrDDpXa3cdJ
7chtcm+ebaFzW5L0Mqzj+1dWOxxHD4hNgxBSHull0w9ML886ehwYfKHKaDvCacSmQwhpm41VHvU4
ukhltB3hNGLTISQrXaaxI5zRYdRLQGzBCOv7hI8nTNgfAX5gOWkQQrKxMcqjHidSJIWN8R0IIeWR
Xj59YsumXp5hqJx+GD9QPx5CSMeCQqcXvHLKvB+nsvo6ehr68RBSWTq1scNm/WBGt6G5jyWUUzh8
/3T9GMLHU7k0CCFt48pVR5dH+Ptx0vXLScMnPQ1CSMdiS6D5p6PLp++frt1+fYeeTqw+ISQbtsSZ
f/QyFi547S/zMOgi4eMJE/YPp0HIxqDTGjtsHlczOozhghFTOJx/Mg52fBHdN52wP4y6UGwahJA4
/PJV2fKYVd9px+iH48CgC8WmQQipJK5s+oUwXJ7D6P66QLnaur7bksSmQQjJji1aXvmCwW1JwmU4
jO+PHV2gXG0/DgxuSxKbBiHtpYvN2aHn/nIKhu7vG8vVDsfRA8pJhxDSXipXHvU4Yf0YwscDYziN
2HQIIRuHytwDYPCFyin7YX89oJw0CCHtpXLlUY9TWX0fGCuXBiGVoIs0duiFo9zC58eBwReqjLYj
nEZsOoSQSlCZ8qjHgcEXKldfRw8oJw1CSKVBIfQLYmXuAZXVDsfRA2LTIIRUgsqUR73Mw+AL6b7p
lBuHkM6iCzR26CWgMoUPhsrph/ED9eMhhHQsKHRuS1JOmffj6NqgMvqOyqRBCKkkrgD6BTG9POvo
cXSRymg7EOAHpschhHQMlSuPur8uUo52OA4C/MD0OIRsHDq5saP9BUP3h0EXqYw+gNFtBWL1CSEd
S2yZ1P1h0EUqow9gdFsB5x+TBiGko9DLZ1b08owdtyWJ1Qdh/8qlQQipBO0vj84/GQc7bktSrr4O
ApKBzj8mDUI6ki4zZ0c5BUP310Vi9cP+MOpCMfqEkA4mWIbD+P4w6CLhe0SYsH84DUJI16Qy5TNc
9su5v+hxYNTFKvMdCCGVoJwynyS9rLdf36GnE6tPyMagSzR2lFP4/Dgw+EK6bzphfz2gnDQIIR2H
LZP5z1nQy7CuUE55D8eBUReLTYMQ0rG4Ilm5e4AuUhltAGM4jdh0CCEdQznlMat/udp6HBh1sdg0
CNlYdGpjhy0ykYXD97cquY9FhAtqmPQ4ekBsGoSQDiJffssp9z6KsUztcBw9ID0OIaTTKKNs6uUZ
Bl+onLIf9tcDykmDENJxlFPm/Tgw+EKV0XboAelxCOl8OrdnR8bC4QpSsjBhxxcop9CF48DotgLO
PzYdQkjXQC/D2HFbgVbf/H4WfO1iEJAMbE0jGIcQsimhl2cYSox5v5iy7/z1ODD6AbFpEEK6Fn4Z
xo7bCji/mPKe7o8APzA2DUI6iy4zZ0cIvyDphQ6UU+jSC7cPCzYhmzYdeU+Bf/o9xQ/kPYWQ6kG/
B+hlH8QW/3LuL7zHELLpEr6n+MSW9fT7AwL8wPQ4hHQ9unRjh1+Y9NJVTsELx4FRF4tNgxDSdbAl
2yvD4UJdzj1Fx6ac+1gC7ymEVA/6/SVc9it7j/Hh/YWQTZvYe0pl2BhpELLx6JKNHShMegH3iS14
ujaAMZxGbDqEkK6DLb9eGa5cedf9YaxcGoSQrokt6V55rlzZD8eBUReLTYMQ0nXQy3y4rMeW93Cc
sFBsGoR0FbpMY4creMnChB23FdB90wn7w6gLxaZBCOla6GUYhqTR+cWU93AcGHSh2DQIIV2X1vKc
KNOewRJb9q1KMI4NzX0swvnHpEMI6Tro5RcGv1DHlnXnH9b3AlLiELLp0CUaO/RCpJes2AKXXkjD
acSmQwjpOuhlGAa/YMeW9fT7gx6QHocQsimhl2cY/EJeTtm3/sE4lUmDENJ10MswDH7BLqe8h/31
gHLSIKSr0qmNHShHfmGy1tzHEipbuP1AFm5CNl1sqVbLsA3JfSwhtryH/fU09OMhhGyqdPT9JRxH
T4f3F0I2XfQyr5d1EFvedX1HZdIgpKvTuT07EgUKO+GCV04B1wmnQQipJlCow+Wd9xRCSPsIF/LK
3l/8QPjzHkNItaEX6nLKO+8phOToAsNY9EIHYgue8/fjwOC2JLFpEEK6OnpZB7Hl3fn7cWBwW5LY
NAghmxrpZT+m/If9YdSFYvQJIZsCenmPvZ+A2HtKOWkQsinRyY0deukqp+CF/SuXBiGkq1O58s57
CiHExy/k5d5f9Dgw6mLlpEMI6er4hbqcsh6OA6MuxvsJ2RzoEhOUOipbuIEfUE4ahJBNk3LKe3oc
PYD3FEI2TzbW/YX3GEI2A8oo67ynEJJOl2nsqHzh9gNZsAnZfNhY9xTeVwjZ/Cin7Kf7+4G8vxCy
+WDLe/5zFtLvDwjwA3lPIZsjndrYYYtiZMEL+1u1/FbA+cekQQjZNLF3gMjynu5vFXMf8zj/mDQI
IZs+9m5QRtkPx7GK+a1AOWkQQjZN7B0goryn3x+sWu5jEbynkM2ZTmvssIUusuClF25CyGZNxe8p
fiArC4RsxpRxf9HvGTDqYrzHELL5YMt7RJkP3x90ofA9iJDNhy41Z0eIcGGFUS/FLOCEkBDl3lMI
ISQL4ftF+P7CewwhJATrLISUR5du7Eh/+IcLNws4ISQE7ymEkI4ifL+AUb+R8P5CCAmRfk/R4T2F
kAJdsrEjXLABAvzA9DiEkM0Zd3/Q7xEw+gG8pxBCslLu/YX3GEJIKen3Bxj9gPQ4hGy+dLnGjnAh
RYAfyIJNCAmRfn9AgB/IewohJCtt32N8eH8hhIRIv5/4gen3IEJIl2nsCBdWGPVSzMJNCCkP3lMI
Ie0jfL9AgB8YrucQQkhb9xQf3k8IaZtObexwZbScws0CTggppfieot8jYNRvHrynEELawt1beH8h
hFQCe9cw//CeQkjH0Ok9O/zC6gq2X4rDNwNCyOaOvTWo9wgY3JbE3VN4XyGElI9+fwG8vxBCUlHv
D/o9hXUWQuKpaTHkP280pr29XH5z7cvy9Y/uLX161uet4ZLLQk02JxYsXSu/NeXj9+cfIQP6dM9b
SRrPTZgvtz8yXT5z1m7Ss3td3gr0mwfvKWRz4q25K+TmB6bKj887UPr26pa3kqyglnTv0zPl9WmL
5QPHj5Fu9e49EesthKDO8qurX5TLv32UDOjLOksWGpua5Yb7psi6DY1y8iHbSl2tu2HwnkLIrPkr
5fp7JsnFnztY+vZuf52lUxo7ps9ZId/6w5P5PUJIKaO27isXfvZANnZk5MWJC+XnV72Q3yOElLLH
mMHy9Y/szcaOMkAt6aEX3pYrbn4tbyGEFDN8qz7yk/MOYmNHRtDYgRc0/7p/St5CCGnFPHR3GtVf
Ljj7wE23sWPpyvX5T4SQEOih0KuH6/lE0uA9hZC26W3uJz0SPZ9IVniPISQd3FtwjyFt09zcIstX
b8jvEUKKaW5qksmTJ8vee+1e0lu7PDqlsYMQQgghhBBCCCHE0dTUJG+++aaMGzcub2kfXWbpWUII
IYQQQgghhJBKwMYOQgghhBBCCCGEVBVs7CCEEEIIIYQQQkhVwcYOQgghhBBCCCGEVBVs7CCEEEII
IYQQQkhVwcYOQgghhBBCCCGEVBVs7CCEEEIIIYQQQkhVwcYOQgghhBBCCCGEVBVs7CCEEEIIIYQQ
QkhVwcYOQgghhBBCCCGEVBVs7CCEEEIIIYQQQkhVwcYOQgghhBBCCCGEVBVs7CCEEEIIIYQQQkhV
wcYOQgghhBBCCCGEVBVs7CCEEEIIIYQQQkhVwcYOQgghhBBCCCGEVBVs7CCEEEIIIYQQQkhVwcYO
QgghhBBCCCGEVBVs7CCEEEIIIYQQQkhVwcYOQgghhBBCCCGEVBVs7CCEEEIIIYQQQkhVwcYOQggh
myYtLSINDfkdQgghhBBCCrCxgxBCyCZJ40uvyNo//02aFy7KWwghhBBCCMnBxg5CCCGbJI2vTZD1
11wvLYsX5y2EEEIIIYTkqGkx5D8TQgghmwwtq1ZLy/LlUrv1EJH6+ryVEEIIIYRsijQ1Ncmbb74p
48aNy1vaB3t2EEII2SSp6dtHakcMZ0MHIYQQQgjxYGMHIYQQQgghhBBCqgo2dhBCCCGEEEIIIaSq
YGMHIYQQQgghhBBCqgo2dhBCCCGEEEIIIaSqYGMHIYQQQgghhBBCqgo2dhBCCCGEEEIIIaSqYGMH
IYQQQgghhBBCqgo2dhBCCCGEEEIIIaSqYGMHIYQQQgghhBBCqgo2dhBCCCGEEEIIIaSqYGMHIYQQ
QgghhBBCqgo2dhBCCCGEEEIIIaSqYGMHIYQQQgghhBBCqgo2dhBCCCGEEEIIIaSqYGMHIYQQQggh
hBBCqgo2dhBCCCGEEEIIIaSqYGMHIYQQQgghhBBCqgo2dhBCCCGEEEIIIaSqYGMHIYQQQgghhBBC
qgo2dhBCCCGEEEIIIaSqYGMHIYQQQgghhBBCqgo2dhBCCCGEEEIIIaSqYGMHIYQQQgghhBBCqgo2
dhBCCCGEEEIIIaSqYGMHIYQQQgghhBBCqgo2dhBCCCGEEEIIIaSqYGMHIYQQQgghhBBCqgo2dhBC
CCGEEEIIIaSqYGMHIYQQQgghhBBCqgo2dhBCCCGEEEIIIaSqYGMHIYQQQgghhBBCqgo2dhBCCCGE
EEIIIaSqYGMHIYQQQgghhBBCqgo2dhBCCCGEEEIIIaSqYGMHIYQQQgghhBBCqgo2dhBCCCGEEEII
IaSqYGMHIYQQQgghhBBCqgo2dhBCCCGEEEIIIaSqYGMHIYQQQgghhBBCqgo2dhBCCCGEEEIIIaSq
YGMHIYQQQgghhBBCOpU5c+bI8OHD83vth40dhBBCCCGEEEIIqSrY2EEIIYQQQgghhJCqgo0dhBBC
CCGEEEIIqSrY2EEIIYQQQgghhJCqgo0dhBBCCCGEkM5nwwZpePY5aRz/ukhjU95ICCHlwcYOQggh
hBBCSKfTvGy5rLngQln/96vN56V5KyGElAcbOwghhBBCCCGdTk2/ftLrS5+X7u86XWr6989bCSGk
PGpaDPnPhBBCCCGEEEIIIRudWbNmSd++fWXQoEF5S/tgzw5CCCGEEEIIIYRUFWzsIIQQQgghhBBC
SFXBxg5CCCGEEEIIIYRUFWzsIIQQQgghhBBCSFXBxg5CCCGEEEIIIYR0KiNGjJC5c+fm99oPGzsI
IYQQQgghhBBSVbCxgxBCCCGEEEIIIVUFGzsIIYQQQgghhBBSVbCxgxBCCCGEEEIIIVUFGzsIIYQQ
QgghhBBSVbCxgxBCCCGEEEIIIVWEyP8DCYCn0/DQe6QAAAAASUVORK5CYII=

--_005_SA1PR11MB6991D26064AD4933042E60EE92D4ASA1PR11MB6991namp_--
