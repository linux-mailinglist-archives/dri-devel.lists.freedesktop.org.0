Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C261944E2E
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 16:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F4A10E996;
	Thu,  1 Aug 2024 14:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZaBa7RdR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD0210E996;
 Thu,  1 Aug 2024 14:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722523153; x=1754059153;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5JLiULkEN4ZmC4MvCYQDObZPoRR3Zf/57JHOcZBsPQ8=;
 b=ZaBa7RdR2fWigHopPHs+4KPxLd+W8FKw4JGPYXvWl+d8o+QTgcC6+KZi
 PTPi64UqYlBCHLqjgXbrOEgYYpU4b4DGzzIqo0rQruFEoM9htl2pGik96
 gemKv7DpCz9USssoQvcXP5O2l3VODal1RABubRxbIP9Rbf9LFv4gHc6ur
 c1LeiT0qPxTccPDe7fn6l70GLmhmseJiLgx4EdNtYeh3gyAEf+g9OEvXP
 Bv5C2GjcwK8oivUoNiKzvRhYAtqMVKNsRNB8yB5kxZakRS9EkWhwdaj6/
 pCuccCYiKdYT9NJ3xuIDg0e/J4q1LnBipyFeO/jpP2HpXUTYHJFfiY2nt w==;
X-CSE-ConnectionGUID: Aj/5OuInQOyDiAWmNkDP+g==
X-CSE-MsgGUID: /0v2BE33T4SxntTTqbeZJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="24343759"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="24343759"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 07:39:12 -0700
X-CSE-ConnectionGUID: u9fjroswTY6SjGe+bpUHOA==
X-CSE-MsgGUID: ehDaSQnnRhCNgEuOZAVhvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="59872807"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 07:39:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 07:39:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 07:39:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 07:39:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLl3Atln5vu+3jMaQh6KmibuC2twp3R+WjVw741w8Lm8R+xtuE3m3NcbNWwwyp26oRmqprZpVrnv57d0W5/aCV6/R0wh/vQMinYlJXNJqEjW8iFpU2lsVByDOHF7ArILbd18SSThi93Q1QDVzMULXK7FWkFDomE1oMvQLPfDJv7xZ7BZugd+pJ0NhqeV7vxI5htHZ+hAENBO1wCytDW9Zt6YkgmDAXfTk0enrLY+CS+GgnhkCqHwbWlYxc8fpP++u1Vrvy8Z3XcibHBFqJuKSVlUImqz4Fa1l9kksLUlnpKWg8Nmdfl6V1DwycwQ80WYcvd5dWZbDvENt0eK2I8/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYmH822+k9sv7q7Zfie1OknQkyD2HAAgaM42N9tn51c=;
 b=cemQY1D8bX7WhOaixRMkRxXX1XChbJAd1+X26wsTztZgGSDVKM31/Mo3ydjnLKPdXDdXnLXgK3ewmDjz41eIhC3fs0QskGcFYE6hcVlgQaId/Z7zEkI4GR1KIgsve2lGZjKg68nojhfRu27SJgLElcLZ9WvlzBMvfig29+ulFXkX93OiXJYwlFm6biFAn8LvWuZRdjdOcI6nCS/6I0Hkby6Tw4FcMBQQRgnhhNyURwmzOojiiXHjheBlSyewDrO6Tnsuk7FgSMqQyozVYZgz30GNdK1RV2SGwfyl+Zk71XntJQ110bIA35b93MfakI/kEuItd414L4cmNQ3vco4LCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SN7PR11MB6798.namprd11.prod.outlook.com (2603:10b6:806:262::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 14:38:59 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 14:38:59 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4 2/3] drm/printer: Allow NULL data in devcoredump printer
Thread-Topic: [PATCH v4 2/3] drm/printer: Allow NULL data in devcoredump
 printer
Thread-Index: AQHa45EhF36izAgqe0C6OeukODdQmbIRZ+xAgAAdMICAAOhMMIAACeYAgAABDTA=
Date: Thu, 1 Aug 2024 14:38:59 +0000
Message-ID: <CH0PR11MB5444812AE1294E55338D133AE5B22@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240731213221.2523989-1-matthew.brost@intel.com>
 <20240731213221.2523989-3-matthew.brost@intel.com>
 <CH0PR11MB5444E19C7B2423D654F3B2AEE5B12@CH0PR11MB5444.namprd11.prod.outlook.com>
 <ZqrQn8BwrVdXtdjG@DUT025-TGLU.fm.intel.com>
 <CH0PR11MB5444838A9E768A2E4D990E24E5B22@CH0PR11MB5444.namprd11.prod.outlook.com>
 <ZqubytFqikzQoKtC@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZqubytFqikzQoKtC@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SN7PR11MB6798:EE_
x-ms-office365-filtering-correlation-id: 915d7649-2348-4bf9-732e-08dcb237ae36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?D7qygVvkzJ2GahH6r2CgLBzXDEr6iAoTj94gcKR0uHFTowTqNXyqGh+DDrhr?=
 =?us-ascii?Q?S4gDSSBM49tlHE4TquIJmmAPLRIW5PpIiRy6jbFycEtZKI5vnIk/Lxdy92Do?=
 =?us-ascii?Q?6otsLhGgmxxOVVZQ8JI2BTCZUYHK2eIhJrtrvRRR7n8JhNApFH2MQupPMYd4?=
 =?us-ascii?Q?kP0TRHpEkgaQ3St/uiYoa0ZgHLHR7uUJDC/t85TiwSM6ICEQatO4E3qRAtJV?=
 =?us-ascii?Q?h6sliCdEUDq7rM+xV8lyZm2z2RVR7/Q7pCilXiv3wTbYwPbD56mmuwLV5VO8?=
 =?us-ascii?Q?qzAStIXx8pH0lNcivcJKuHOqTm9Kv/R26lr8IpwFR+3YXH/Pj/QS+A3LKNgO?=
 =?us-ascii?Q?jhoKolG7vz2RPmjzx7NxE4TQkqMZhpL32N1+ujVRr+Lv/J7uMswFzkZx2iY+?=
 =?us-ascii?Q?ffxLnFxhg1+JrEj8hkGFCEM0IRnz7qas8y97jv1KAOBezCnfe/XnvNsmolIb?=
 =?us-ascii?Q?frfuRuqaC6y0hgNmf+39XXZWq6XLoprteM2FimIQCCowi1XQhsIl/Y7qmg3A?=
 =?us-ascii?Q?2wLcbb540RCK6grLR+F4lHye510jK6NK5m1a8NzIjxaMiCP9/is2mhCwxqXZ?=
 =?us-ascii?Q?qzprLbgSh+QvvZPXkVI0SLDecfvN851TJb1HpEW5VdG4zhQnyHv0ZuCRHobD?=
 =?us-ascii?Q?8Pfup/fm4afAgyAK6k1Sx2gz0hjitES1HOHmIIjZtqo5myokUQgq/OUWzGHL?=
 =?us-ascii?Q?7rnRhLXK8XKqnMhc8N3m5Qmy69YQIGzWV+5l+To8SXViThgzXVB6VN8o8BB7?=
 =?us-ascii?Q?lJBLLyjzEUj6K6WYfn5SRoB4NHjvlnP4Dv8KUa2St1gHelCx6MkIHDryeIaU?=
 =?us-ascii?Q?RijlUvPKTY8dsG+X9TYLzXa8/xI+gNWp02RvMb9/Xsu2QDQT2ria/30H/Vrp?=
 =?us-ascii?Q?UkewI96AJB2wYKhxh0s+RQm0zX7n2UvmFdVVnO3qaM6OIq4SdHtnHiZvx0QH?=
 =?us-ascii?Q?RONsiLoHwqGUkuncJNTyl2vJCl9GXzLrFP+/sVY0Mgl1uKOxGWArAjSIjGP5?=
 =?us-ascii?Q?d27YshxIMfnqN8UXaTOLrM6vYhKmaZzqw0BsXBc68q1GK/IB5TD5cCBJ1FTq?=
 =?us-ascii?Q?1GUtEtQDbnhCr0bN0IHy2XHDPf32is8PLfmjgyullEbh7x5G+MegiQGwevlm?=
 =?us-ascii?Q?vtxXv6cMjeGljgBPfYCf94pZbVcFiMpU+E2xyRcTo0rJJ30Rp9xhmoqIizfA?=
 =?us-ascii?Q?am8ZgUYae9Y5WcrB+6aWhQOK5usgWrsd7k21CbBp5amQWLaAKu1dCWyRA8UO?=
 =?us-ascii?Q?9AbNQd0nue4ombR17TnvLIG3lUprTnaPjEyBj1WJYRdefm+gZaRrOfVrfjY8?=
 =?us-ascii?Q?PikCxegOMFY1nqBShI0Kk3Vs00MjVAAkYFQ9U9tEnICdUXDvxOllxY8ih/H/?=
 =?us-ascii?Q?6+A5zUiLeQ6RW2D/ugZvuqmwjIU4r+RWM/23E33xoQSE+w9c0g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Txe5PFTvQS/EYq8SR4wEAtKbz1FZrx57p9Hewkzum3TTDuNOx05UyfWo+8my?=
 =?us-ascii?Q?Eqz04OOouLN0/jmTkbvsU64SesJI+1ILfc+fqwDUj+DBBPIJ9wiWd1wrWmJM?=
 =?us-ascii?Q?VtcmOnRGy21720ruCnjI/lk8tIV7++CHcGVxJ3/PgIqXaPs49j/fPR73cE/H?=
 =?us-ascii?Q?IP9WbC6+AUasgzu8YihiJnKrRa+9HhoPv9iKQDWqG8rfwCz+oz+WN1JQMYwE?=
 =?us-ascii?Q?boAbBACHt6EH8SaVm8d9AlI20KxUiBhUzsD6QNKKH3JZVLIfFSs9b31cQmi3?=
 =?us-ascii?Q?iJ6suX2/BRYANUobJbX0tPpHaOX3FC6QQthBLCg/Nzrsl5WOMuyJzcsMc/ZQ?=
 =?us-ascii?Q?cp4Ql35fNrAeoBDhU7Z5/X2AFn0JlW03Tsm0H8ONr/M1/hYJLX5BXJV50KL8?=
 =?us-ascii?Q?9Rdv6oISfvaj+al+wpeZLMfJv8jdtNYoEL9q8cYgECJ7lg6plN4Hl9/U1Dan?=
 =?us-ascii?Q?i54bHWpceo4iJSqO4L91pD9u0YVq8SNN2/tpBuas4LvwqWZxPZwLIZ9SBkqG?=
 =?us-ascii?Q?TPcm5LQpzb9ZwWJjqNj44wK/8XiWHk4mcntPIM/dS81gwudtPg87AVpdLITx?=
 =?us-ascii?Q?Xig1m2lPRlLmr6HOYSPn3TXcVCkCnuZ6FsQZ28xb54TAhBKpEbCINrwBeW65?=
 =?us-ascii?Q?IrCogc1fLhloHGHKHreLUVgr5+7IIm5j7FVDzc7uZtfEVGZgNqntRVwwvFJF?=
 =?us-ascii?Q?VbXQHYs4pplvJejdPfQDxoFiBU19kQUsz+/QbnjtgeIB8BUJUqmdStalLerr?=
 =?us-ascii?Q?OH0tOHF0jPf8rigmr0J2aOuCvgoFzFpdMN+DWADvB3a/ZusrniZIPzfIkPx5?=
 =?us-ascii?Q?aZOSTeaYpUxpXOdDugH+dmgwXmnpqy4r176C24TVU6QvPTb/jVcdSKkhEM1y?=
 =?us-ascii?Q?snmaSsHeSDZWp5Mw/n/5fPtctX3+l33fKtz1OxTB6NwcxoUoM/mV9V76oMuy?=
 =?us-ascii?Q?ZD+jlRKNsbPOp5VkSccEp463AH9lBEAVCSN/+6hgoGthTDVUrGz0MyhCe8W2?=
 =?us-ascii?Q?+6D4ErocNiGLzgHu0HWVQpu/CBYOge7xY6tMnxxTe7oLQ1P0YhgQkh3cIhVU?=
 =?us-ascii?Q?ZysauIPxF+41uYOuwZvLgxw1+NW07QGBF9nZlkN6AsLrz+Aini7I9byWB9iY?=
 =?us-ascii?Q?miD/bySc+U/ViClx7WjJ5maVRhewy3rkEIJXX6MBHPGaVFt1fmaCf+oe5hye?=
 =?us-ascii?Q?36P+NjfFqe831HdnqpcgsNYV7TB0JGjWul+5bqfpgLk/yQftN3/zJn9Ki3r6?=
 =?us-ascii?Q?ePxaO6mewHm9K6kZhWzEMGU1DzgACO2VH7V70qRYAVXymJR5LR3C2WcYY3Yc?=
 =?us-ascii?Q?KWUpFaqcwcNpD5EW49gOtgxf0EK3OtbFRkgahAfrzAHsjaxVgbJ1Wyghgn6B?=
 =?us-ascii?Q?WHSlQP4I49WKlnRLsat5Af/cSpyZImrdfv8O0rv25OVBG26ECWyKww+GLrr4?=
 =?us-ascii?Q?0azDJDhbNPx0uVeDsKeUHQ3+ZDmdvDGC5nUdzjHvSyWLF4Sj960UveC5eiAE?=
 =?us-ascii?Q?6PX1yFihnz8CVevqUiA8kxrgMaepe1eEl9f5cOl7G3CvIZi3esBbiebjscGa?=
 =?us-ascii?Q?XKdrmDzvJHMhIJmxlM8kuj2MiZKk5zmBsNkeZ38IpeXAI4UhFf9GCWjHlS14?=
 =?us-ascii?Q?0Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 915d7649-2348-4bf9-732e-08dcb237ae36
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 14:38:59.5041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oMhO7ZNXXFmGiDD3jfJpnWDVsAlu6b35PE2ygH4BEAiuVUDgRc9YfYkTUzD021IDEkh3lk987cQZwvdE8Jkk5OOogFRbcV54YXLniAkO+RA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6798
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

-----Original Message-----
From: Brost, Matthew <matthew.brost@intel.com>=20
Sent: Thursday, August 1, 2024 7:30 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org; maarte=
n.lankhorst@linux.intel.com; Vivi, Rodrigo <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 2/3] drm/printer: Allow NULL data in devcoredump pri=
nter
>=20
> On Thu, Aug 01, 2024 at 08:00:21AM -0600, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>=20
> > Sent: Wednesday, July 31, 2024 5:03 PM
> > To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org; ma=
arten.lankhorst@linux.intel.com; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Subject: Re: [PATCH v4 2/3] drm/printer: Allow NULL data in devcoredump=
 printer
> > >=20
> > > On Wed, Jul 31, 2024 at 04:22:03PM -0600, Cavitt, Jonathan wrote:
> > > > -----Original Message-----
> > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf O=
f Matthew Brost
> > > > Sent: Wednesday, July 31, 2024 2:32 PM
> > > > To: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> > > > Cc: maarten.lankhorst@linux.intel.com; Vivi, Rodrigo <rodrigo.vivi@=
intel.com>
> > > > Subject: [PATCH v4 2/3] drm/printer: Allow NULL data in devcoredump=
 printer
> > > > >=20
> > > > > Useful to determine size of devcoreump before writing it out.
> > > > >=20
> > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > >=20
> > > > It seems this patch prevents us from copying strings into the data =
field if the data
> > > > field hasn't been initialized.  I'm not certain if it could ever be=
 uninitialized at this
> > > > point, but I recognize it as good practice to check just in case re=
gardless.
> > > >=20
> > >=20
> > > That's not the intent. The intent to call the print functions with NU=
LL
> > > data so the printer can calculate the size of buffer required to prin=
t
> > > out all the devcoredump data.
> >=20
> > So if iterator->data is NULL, you want to NOT copy into it?
> > -Jonathan Cavitt
>=20
> Yes, exactly. Run devcoredump printer with NULL data to get size, alloc
> data based on devcoredump printer offset, run it again with a valid data
> pointer to print.

Okay, I think I understand.  That might be good to add to the commit messag=
e,
then.  Something like:

"""
We want to determine the size of the devcoredump before writing it out.
To that end, we will run the devcoredump printer with NULL data to get
the size, alloc data based on the generated offset, then run the
devcorecump again with a valid data pointer to print.  This necessitates
not writing data to the data pointer on the initial pass, when it is NULL.
"""

Maybe that's a bit overboard?  In either case, my RB still stands,
regardless of if the commit message is updated or not.
-Jonathan Cavitt

>=20
> Matt
>=20
> >=20
> > >=20
> > > Matt
> > >=20
> > > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > -Jonathan Cavitt
> > > >=20
> > > > > ---
> > > > >  drivers/gpu/drm/drm_print.c | 13 ++++++++-----
> > > > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_pr=
int.c
> > > > > index cf24dfdeb6b2..a1a4de9f9c44 100644
> > > > > --- a/drivers/gpu/drm/drm_print.c
> > > > > +++ b/drivers/gpu/drm/drm_print.c
> > > > > @@ -100,8 +100,9 @@ void __drm_puts_coredump(struct drm_printer *=
p, const char *str)
> > > > >  			copy =3D iterator->remain;
> > > > > =20
> > > > >  		/* Copy out the bit of the string that we need */
> > > > > -		memcpy(iterator->data,
> > > > > -			str + (iterator->start - iterator->offset), copy);
> > > > > +		if (iterator->data)
> > > > > +			memcpy(iterator->data,
> > > > > +				str + (iterator->start - iterator->offset), copy);
> > > > > =20
> > > > >  		iterator->offset =3D iterator->start + copy;
> > > > >  		iterator->remain -=3D copy;
> > > > > @@ -110,7 +111,8 @@ void __drm_puts_coredump(struct drm_printer *=
p, const char *str)
> > > > > =20
> > > > >  		len =3D min_t(ssize_t, strlen(str), iterator->remain);
> > > > > =20
> > > > > -		memcpy(iterator->data + pos, str, len);
> > > > > +		if (iterator->data)
> > > > > +			memcpy(iterator->data + pos, str, len);
> > > > > =20
> > > > >  		iterator->offset +=3D len;
> > > > >  		iterator->remain -=3D len;
> > > > > @@ -140,8 +142,9 @@ void __drm_printfn_coredump(struct drm_printe=
r *p, struct va_format *vaf)
> > > > >  	if ((iterator->offset >=3D iterator->start) && (len < iterator-=
>remain)) {
> > > > >  		ssize_t pos =3D iterator->offset - iterator->start;
> > > > > =20
> > > > > -		snprintf(((char *) iterator->data) + pos,
> > > > > -			iterator->remain, "%pV", vaf);
> > > > > +		if (iterator->data)
> > > > > +			snprintf(((char *) iterator->data) + pos,
> > > > > +				iterator->remain, "%pV", vaf);
> > > > > =20
> > > > >  		iterator->offset +=3D len;
> > > > >  		iterator->remain -=3D len;
> > > > > --=20
> > > > > 2.34.1
> > > > >=20
> > > > >=20
> > >=20
>=20
