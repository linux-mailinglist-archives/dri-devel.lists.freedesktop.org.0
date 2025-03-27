Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E55D2A729C3
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 06:04:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D6510E296;
	Thu, 27 Mar 2025 05:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EBMoyciH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BC610E27A;
 Thu, 27 Mar 2025 05:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743051843; x=1774587843;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=idr+p/snY/X5fUug0pMpez+SNFHhcbTQbkYS3EhmL7w=;
 b=EBMoyciHY2+qOgbKKjR38Z2wb1HLVuvWui9Sf5Cr/JOgwj+B2Y8Jwp84
 ooV+XAmEJ/9K0dE9eYrCydSGF5a0RaGUieWEhZhediHtNBYG5pLqztqLO
 FLTaF7unoJM4XO84gP6WzXdvxg6AXxBP7INP+9wlkBd+CzmEjW0mCzvC8
 lhkyvVYgQBk/roZ1hYZ1lXlK56gYqtCenclpjDovFhmNVYskS+yFYeNJm
 O8EbMuaI/aCLIuL2SIVTuDuBpPpiYHaEmWL6CM/r3GdhVhsOI01Rcz6vn
 4cOheSWH9Bgepibv6bKdjuHo8CLzbpYogt0t3gCSFiywUotBVsgGCd7zH A==;
X-CSE-ConnectionGUID: Ro04zD8ZT+OIGAEDCvlLww==
X-CSE-MsgGUID: c14GrGKMQ06apo9EgkMQ9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48020561"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="48020561"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 22:04:02 -0700
X-CSE-ConnectionGUID: eGInyJXXRJGoNpplZQHUyw==
X-CSE-MsgGUID: rPeLpO9jTjmYASETlc7lAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="162256765"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 22:04:02 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 26 Mar 2025 22:04:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 26 Mar 2025 22:04:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 22:03:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSDPi3tJSIwVRoyrMOhCV6UfvNfDHvmUkqafJEEWXSDZWFgasoHbS5CAwYfmKPAjeZcPxbL5blOsw5YCR5ioK1IhORwIl2hO24HpmjzGAf0K12/tavuofT0ySa+1To8LNVE193ug/CUqsrjQ0mkPFveqPNvomipLegJbXSmJNXx+A49LINsX6yQISG9PoNj1CECq4H6P8ISWnn2kIKi1Z9+I31WboiK3n7baF99pEoMTpTc5CCVsZ4iD9QbWJFDYrCMSD4REPLlGcaGgXn/zPUF2B1k3g3zzVbLTjDoIrVLbqpmfwOfoyTOjnHevBt84DJx5HtAXA8/zp1IKt1yQxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7N2/uwbvrQWQVLGoYooRnyMSqcHam4h+Y9q9sNLxoI=;
 b=COSHN7+W70pDK0ZbFbnU/+BPTZDkqfUb/9O23EW0Zd+lhoigxIspSXbw1q4RdMClGB5CnBaXfRdmF0IBxdcHkL4fQiUPO9dDZDSr93Ixy7H38vS9EuKXzxiqFRpu5j0VKmiVOdR0FZxkJQTlzBQr/X++wdV076SStOjHjpG1KergHol8S8Fje9loRRFA5zbpnO7hBWxEgV/FPoQwV/JkB/slFDhh5K/oG7O13FC1zYBqX1+/figqTv7WU8nvutTES/PFMFvrapbcI8CIKaKnwCsD6w5WSH8MkT16S8LbxfPSYRDaEz4zIVYJRRAKHVpVU14vt3fWm8Z+IneR9TBd/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by IA1PR11MB6514.namprd11.prod.outlook.com (2603:10b6:208:3a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 05:03:57 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 05:03:57 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Borah,
 Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, "Kumar, Naveen1"
 <naveen1.kumar@intel.com>
Subject: RE: [PATCH v9 2/3] drm/plane: modify create_in_formats to accommodate
 async
Thread-Topic: [PATCH v9 2/3] drm/plane: modify create_in_formats to
 accommodate async
Thread-Index: AQHbmLxC+Q+DQw4TV0ivQ+WDcveDsLOFth8AgADDVfA=
Date: Thu, 27 Mar 2025 05:03:56 +0000
Message-ID: <IA0PR11MB730700DDCF904D697B9FF5D2BAA12@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250319-asyn-v9-0-629d1ece63e7@intel.com>
 <20250319-asyn-v9-2-629d1ece63e7@intel.com> <Z-Q4FJXLt8r69sjK@intel.com>
In-Reply-To: <Z-Q4FJXLt8r69sjK@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|IA1PR11MB6514:EE_
x-ms-office365-filtering-correlation-id: 19cf1b21-fc3c-4a67-1861-08dd6cecc768
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?1Ru9ag4/GbY/WzIMzlE3YuGH+KPn5Di655d9RWQMif4UgiYhDVgI90rfx2?=
 =?iso-8859-1?Q?681tC2bfT42FCDPkZNKc5O3mj9SrpwlgKVo6uc8+Tw/ILc3JfcvOHdALZ0?=
 =?iso-8859-1?Q?FBxuckNKVYXQ/cyDL+VgYfTSzc2rNuJLca4I7QoiK9Ueei3+TUwegBA5qo?=
 =?iso-8859-1?Q?3aRJ+1BgugUxAATixEaVGvdAGVv2TDTQrWzvKqV8gSCPD5wocU/TjmwkRj?=
 =?iso-8859-1?Q?PumqzR899r3sNPU/ca+s5ta0b3rpeihHpoxHkPHWNQ2sggCogIADB8hdVj?=
 =?iso-8859-1?Q?sOWShCAZrjGQSpQMlvXbEDNF1YAosJny4G/8vSuMH3LVoM4uAPismdyKdQ?=
 =?iso-8859-1?Q?A4Up8kiz+zaa+8aDzwpewFKCsHnRx4JMaiXJGL7etTPf95/PZGZt0As3dD?=
 =?iso-8859-1?Q?hf4XDatrKgqPlT1WRaYWHkOkxeRAcuxuSaBRU27eLT8YQTzwJtULhy9oAw?=
 =?iso-8859-1?Q?wIH1tfLjrKfLislSrBbFT7/572PU5tjroG61sQUwdB24u5ejZmxoP9Rsto?=
 =?iso-8859-1?Q?6+R8+lZdr6OMlmCuj55x+8lOkaRj7kJ+4dCcJsN2YS0vlYKdArpT7EmI8R?=
 =?iso-8859-1?Q?z9RRsrK35GW7HG7e0TH4GckRFnAUFiX44W8tb8UlRTccf/5O6NGAZQrjhP?=
 =?iso-8859-1?Q?6I0JtiNn+/kMCNrGxvRmdkInwdZdPn/L7OL/XceR0Ex2Y1R2VWG8zQ5rvB?=
 =?iso-8859-1?Q?wB/2pXyeTZM4DIhenvrqpNTKk0ZQ60KolE2gLawVbReFLZBe4tr5N+nPLt?=
 =?iso-8859-1?Q?h78QKc/IaflDFQ3UO5aPwZPd5fNG3UocZTv4V3C8g8gfoZfu0oJds/xr+V?=
 =?iso-8859-1?Q?1tAWvUbUSbL7p+M0dGY0g3wvd/LvydvFel7DWOLkS1Ws857Qn9doDdTMV+?=
 =?iso-8859-1?Q?9VV1N+xUh3D4RH7XD4ksdJd1RQhbo3aASc2fMrCBdTLTd58/eDD+zfYWPG?=
 =?iso-8859-1?Q?LyvfwC0O9ows8hh5sAP1xl/5sQAyIOiwSeVyWMkUxqq1ZoYQoYuNXvbnHi?=
 =?iso-8859-1?Q?So8wkKJlLTfP+BYZq+KahyHLfkh9HIJBEh5qrDJTEMoQpB6Exp7zw1aQhM?=
 =?iso-8859-1?Q?1Ogw+AS5ymLGHn5k5rL6UVq3NGtNRqtDTwvLA8/Yw6hUaNHhUDV3yLnjLW?=
 =?iso-8859-1?Q?My7nTeJPw5JNhe/WFMypxMaIgJGPapkqSBSxVAsTBAmo4idtsNyzUMOJPR?=
 =?iso-8859-1?Q?rK0IzDrqJ85FINtlcpv5AUcJw4rAFPGJ2EanDyE+j/IUSy5gPoqm4im/nx?=
 =?iso-8859-1?Q?9dFnRNzJa9ZE0DjFQU5mWDjf9zKKTFdZVTd/z+TxqhOX1JxDxxehGeFK/K?=
 =?iso-8859-1?Q?0NBw7PLA/Mbl9qCy8v3SfS9fHtdXm09w559bGepNbhXqznfvV29quR3Fj2?=
 =?iso-8859-1?Q?9O5qykkcs35tYvPUQxj2wgvQCAGmSsKBjsgtHjiorbx+eDgm497ZFMebRS?=
 =?iso-8859-1?Q?Zr3AptgkLsFyf/hI6NOosdjHKLY2NY5cSsl1ZtWVhJfJbrnm70yM1duova?=
 =?iso-8859-1?Q?550dmQ9FXpRcHRAlGFXDlt?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?oU9WkpanMhCKZ7/VyYk3/7RY4sAWBYE+JxlYUutYAblU7MMsAm9/2uNf6y?=
 =?iso-8859-1?Q?gO/AjA9daBfsWnc0ut8KjnV+xT7gmudZMASRQv/DPQHeArTML7vBuVDx9e?=
 =?iso-8859-1?Q?M1Xl4n8dJD9fvzTlLzIeXFopAGr89hwYVqpjxS2TS8/v7VyGV+FUzt2Gro?=
 =?iso-8859-1?Q?WspoigUxvBS7VRJk8/XnIzpHQtpW3uXwmZtgkombqLy4dN9G2ZpC/sbt3c?=
 =?iso-8859-1?Q?GGTneBJEpLTIlWiMmIUX2Gis0IWXXVDvEWnFAvcYgd5RjRbmbdD+53X9zv?=
 =?iso-8859-1?Q?EjoYQlkC9JgLsug8Si58b9lLhAMf7S/BjdOsB93Co8n7Ggo4tkYnoN5K8t?=
 =?iso-8859-1?Q?xFoiKqXqrBIqVfdyeWJMoQYWndQDiZ9RIO45AgUFjWFR/GcWp/qN5Oj2cB?=
 =?iso-8859-1?Q?35OW/tayMmqeyA50q2GraorcTq9NeN6QyDZSFXT5pDpExEWNiZYYACvgK5?=
 =?iso-8859-1?Q?HDzQPcMYWMgSDOrRboQdS3ANoVYIBkd6TxY2vWOZEfyQI75U0ysO8Rq61Q?=
 =?iso-8859-1?Q?p89l7mXdciwJceGW3vXJTlLeAd7S+vON0szqNOUKfPqYEvU+x6Z/CIiVYP?=
 =?iso-8859-1?Q?IeCbBzTZx+g46XS/bVaQ7PJctopwfVCMO1eq8j4T3F+abSQfUfKIK9upro?=
 =?iso-8859-1?Q?bqT5yEPTxRuRFXkQhE2CEsFb7xvq6uQj5X8qX6uRdFwJNN/t/rBKAILL84?=
 =?iso-8859-1?Q?U7h+Ms96ut44kK/TdK9z1lNakG4WnZTQbofE9K3dVgr7HJprZYO96cqAFp?=
 =?iso-8859-1?Q?Yxz48LXW2hWTbt9kY0KErnB672bvTyer71ctmFgwiTyrZeIogDqQwViR+c?=
 =?iso-8859-1?Q?3dCUdNcuk5UXgOyjaPxCA/YrxkP1lJpIJI3gomQghzsig7fwt+JerzLgz5?=
 =?iso-8859-1?Q?jMXzxmFXix68ajFamHzbzRrqjW2fYXaKaHRpZag+Y4mttJG+kPQ5TcoM16?=
 =?iso-8859-1?Q?we7TqLFeVXbC5t4v+oSFDYI2WNUSivWn3UIAUWAiYzjJXWH8x5dM2o663x?=
 =?iso-8859-1?Q?qMeCcRbrdAvmiW/o7oCuDRQdLf2/ZJu9QBUEYLmupQSX7L5GlKtfKF2aR1?=
 =?iso-8859-1?Q?8lKip7Ntekl64hV19ABb0eW8+XiNJqI7HN5d9eUD321t2gZsL+53je5/6z?=
 =?iso-8859-1?Q?ZZNsAIoHMPBa+JwKlRsCWTgKwu3tRI8HfhDBAJTPCp9T4uZnMkVT40rCTQ?=
 =?iso-8859-1?Q?/YshLzrjtHOxdU6mV+SzqK0qzKEzjZh6S9YykHecRZiF8neJfCo6nuFzsM?=
 =?iso-8859-1?Q?ndq+SYDWYsv7FgRSf3EiNSP5HedJ4hfphGppC4sviOVi2cJmVOjKKILSm8?=
 =?iso-8859-1?Q?gFCu1+AX1bweUxqrSbwx9EbfH/kOX/DnXhYgpPzlgko/h9PAduYZJWOFvN?=
 =?iso-8859-1?Q?voyilcqmmZZsj0ij6eqFpw9cdd2m9k4CWUVDlR64oirFVPfwFrCSWjPW5O?=
 =?iso-8859-1?Q?vJEMujbOugHvcxDh+vyGPss1CSpOdKW3kKKbbRp6SGBV8c/EW/u01jY4/Y?=
 =?iso-8859-1?Q?i/5rzQog/AILwjzTcgdPRqRWRh06oWFjwJ15S/RuANqjT/fi3gBEV4khP0?=
 =?iso-8859-1?Q?7l3SGE7tlEFvj+Ecgkg10VQ429HxKBzJjnxIovKS1ofyTWnZzoutBZS79D?=
 =?iso-8859-1?Q?FM4g0ZAcbkXp6SSQ4LS9s8UtUD6jKp4hXj?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19cf1b21-fc3c-4a67-1861-08dd6cecc768
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 05:03:56.9416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s22C86yXdM3QlO+u9RaWmGDX10Q0YICg5Gen9bjmslFYC3z4b6tvNXML4dTj29RqTylE2y0e6JEP4UVL2KW9uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6514
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> On Wed, Mar 19, 2025 at 04:02:16PM +0530, Arun R Murthy wrote:
> > create_in_formats creates the list of supported format/modifiers for
> > synchronous flips, modify the same function so as to take the
> > format_mod_supported as argument and create list of format/modifier
> > for async as well.
> >
> > v5: create_in_formats can return -ve value in failure case, correct
> > the if condition to check the creation of blob <Chaitanya> Dont add
> > the modifier for which none of the formats is not supported.
> > v6: Remove the code for masking the unsupported modifiers as UMD can
> > leave with it. (Naveen/Chaitanya)
> > v7: Retain the unsupported modifiers, userspace should have no impact,
> > return pointer to blob instead of blob_id(Ville)
> >
> > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > Tested-by: Naveen Kumar <naveen1.kumar@intel.com>
> > ---
> >  drivers/gpu/drm/drm_plane.c | 44
> > +++++++++++++++++++++++++++++++-------------
> >  1 file changed, 31 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > index
> >
> fe181c1002171acc68d3054c2d178f9b9f501fe2..5cd3956caf414fa72432f9d23f
> a2
> > 89ec266408ce 100644
> > --- a/drivers/gpu/drm/drm_plane.c
> > +++ b/drivers/gpu/drm/drm_plane.c
> > @@ -193,9 +193,13 @@ modifiers_ptr(struct drm_format_modifier_blob
> *blob)
> >  	return (struct drm_format_modifier *)(((char *)blob) +
> > blob->modifiers_offset);  }
> >
> > -static int create_in_format_blob(struct drm_device *dev, struct
> > drm_plane *plane)
> > +static struct drm_property_blob *create_in_format_blob(struct drm_devi=
ce
> *dev,
> > +						       struct drm_plane *plane,
> > +						       bool
> (*format_mod_supported)
> > +						       (struct drm_plane *plane,
> > +							u32 format,
> > +							u64 modifier))
>=20
> Indentation looks wonky here.
>=20
> Apart from that
> Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>=20
Not sure why patchwork is showing like this. On code the indentation looks =
proper.

Thanks and Regards,
Arun R Murthy
--------------------
>=20
> >  {
> > -	const struct drm_mode_config *config =3D &dev->mode_config;
> >  	struct drm_property_blob *blob;
> >  	struct drm_format_modifier *mod;
> >  	size_t blob_size, formats_size, modifiers_size; @@ -221,7 +225,7 @@
> > static int create_in_format_blob(struct drm_device *dev, struct
> > drm_plane *plane
> >
> >  	blob =3D drm_property_create_blob(dev, blob_size, NULL);
> >  	if (IS_ERR(blob))
> > -		return -1;
> > +		return PTR_ERR(blob);
> >
> >  	blob_data =3D blob->data;
> >  	blob_data->version =3D FORMAT_BLOB_CURRENT; @@ -237,10 +241,10
> @@
> > static int create_in_format_blob(struct drm_device *dev, struct drm_pla=
ne
> *plane
> >  	mod =3D modifiers_ptr(blob_data);
> >  	for (i =3D 0; i < plane->modifier_count; i++) {
> >  		for (j =3D 0; j < plane->format_count; j++) {
> > -			if (!plane->funcs->format_mod_supported ||
> > -			    plane->funcs->format_mod_supported(plane,
> > -							       plane-
> >format_types[j],
> > -							       plane-
> >modifiers[i])) {
> > +			if (!format_mod_supported ||
> > +			    format_mod_supported(plane,
> > +						 plane->format_types[j],
> > +						 plane->modifiers[i])) {
> >  				mod->formats |=3D 1ULL << j;
> >  			}
> >  		}
> > @@ -251,10 +255,7 @@ static int create_in_format_blob(struct drm_device
> *dev, struct drm_plane *plane
> >  		mod++;
> >  	}
> >
> > -	drm_object_attach_property(&plane->base, config-
> >modifiers_property,
> > -				   blob->base.id);
> > -
> > -	return 0;
> > +	return blob;
> >  }
> >
> >  /**
> > @@ -366,6 +367,7 @@ static int __drm_universal_plane_init(struct
> drm_device *dev,
> >  				      const char *name, va_list ap)  {
> >  	struct drm_mode_config *config =3D &dev->mode_config;
> > +	struct drm_property_blob *blob;
> >  	static const uint64_t default_modifiers[] =3D {
> >  		DRM_FORMAT_MOD_LINEAR,
> >  	};
> > @@ -477,8 +479,24 @@ static int __drm_universal_plane_init(struct
> drm_device *dev,
> >  		drm_plane_create_hotspot_properties(plane);
> >  	}
> >
> > -	if (format_modifier_count)
> > -		create_in_format_blob(dev, plane);
> > +	if (format_modifier_count) {
> > +		blob =3D create_in_format_blob(dev, plane,
> > +					     plane->funcs-
> >format_mod_supported);
> > +		if (!IS_ERR(blob))
> > +			drm_object_attach_property(&plane->base,
> > +						   config->modifiers_property,
> > +						   blob->base.id);
> > +	}
> > +
> > +	if (plane->funcs->format_mod_supported_async) {
> > +		blob =3D create_in_format_blob(dev, plane,
> > +					     plane->funcs-
> >format_mod_supported_async);
> > +		if (!IS_ERR(blob))
> > +			drm_object_attach_property(&plane->base,
> > +						   config-
> >async_modifiers_property,
> > +						   blob->base.id);
> > +	}
> > +
> >
> >  	return 0;
> >  }
> >
> > --
> > 2.25.1
>=20
> --
> Ville Syrj=E4l=E4
> Intel
