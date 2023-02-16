Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C0E699D6E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 21:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C15210E370;
	Thu, 16 Feb 2023 20:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5718910E199;
 Thu, 16 Feb 2023 20:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676578433; x=1708114433;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UQkRLve58P1nDkB7upnPTTnALIGYNxxyNDTIvflZgpk=;
 b=FaClJIEb6rz8BJB1SI0cYmdr0OPGFnhoAz9MZn/b2uPuFeSKK5YoKjRR
 rU3upzHfnZ8dNQpdZWwJ/F9WhClsxVG6l3a/I2bzXYRKn/VdT8ks8u3ks
 Gk0VA8Ls0qbpToMGYStRyGxdiDLEX8reEMrBmDieAb7zfjNY9kKIPYUaP
 wQ4riu1P+YaQ5OzxoN938oNwQFVfFxBg9Hv5o+2QhIj4w9ja2jEVXm9l7
 8ogJTPKBHuNZt71xlvY6od6DbR3jdpZ4ULTUDvyElr8PpUqbgdQnfUwHm
 vSLyBGDFiST3k56bIgZNZfG2wxjhNBn5MZl7mdY5OPkEFJct89Vrzohdl g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="359268762"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="359268762"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 12:13:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="734040412"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="734040412"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 16 Feb 2023 12:13:52 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 12:13:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 12:13:52 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 16 Feb 2023 12:13:52 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 16 Feb 2023 12:13:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNmv4ElDWcQ2jQrlvdOHxklSNW6UjfncHieLq4tj1rVTdsSb1Q34v95jL1oGKS6zMdFPQPefs5YPgFSLWLqN+dBTzt1BJEfW0MM3J5QrjPdv/RROImg2A9tIK/DZ1+W/TA2prOAvzGYoyUjpbzoEEIm71MAA9ogTWg9Nrc0mvU5QWi+PgU65KbQNeYO8ca4P1Dm0dQd9UuRKaeJaRBI3SKtzhDeL41hbl56S4B6EAZL9V3o3HdOFyDT699rvAnIq2M2CMsvobzrm5eo8MbQyb7T9NK19uqrkTVmmG6Bl/IUEWYVogmNsZUrr03326SM9UuB/+s6LSpQp401ouXtXUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ob6PJB1FDlPL8KZJ2IiBJt8oDMfHRxMJ0WkKga0QOY0=;
 b=AW1JZ/X4bu5WWyy0N7JF9nNrc25+wTcTyru2W5qNRRkwOhurM8Lq1bso93eu8/vtogEdFLV5jw/NgcksSd5F4lKWPsIJ4656HbD2eNKCqMPcGNazDz82f636jHd1M7bLSbJiwueUmCe3WLI9wifT1/iAur+hknYOkbKV8LdF5kYlVnZlEzegMj9cnyMjSDsKCsoGP3qQNlBC0FuJ2ee0IzUzTOG7db70t64s2tNe7E7vKD7TmxaB5vLNMXARs21ndeTkEw7sKeFCcFA54xa8NeiE2kW+Xms2/wTIuLGdPwGJj2tAUl8Ocoa/Mf1FgYVE5ummh8vZddWJqHYhFOHysw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB7096.namprd11.prod.outlook.com (2603:10b6:510:214::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Thu, 16 Feb
 2023 20:13:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%9]) with mapi id 15.20.6086.024; Thu, 16 Feb 2023
 20:13:49 +0000
Date: Thu, 16 Feb 2023 15:13:43 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 3/3] drm/i915/hwmon: Expose power1_max_enable
Message-ID: <Y+6Odz2Kvqdk3D/k@intel.com>
References: <20230214053342.1952226-1-ashutosh.dixit@intel.com>
 <20230214053342.1952226-4-ashutosh.dixit@intel.com>
 <f7a7e280-804f-b397-a8c5-c4dae0451111@roeck-us.net>
 <87sff7tygb.wl-ashutosh.dixit@intel.com>
 <Y+58hLJYJYVQ5KyP@intel.com>
 <03a57aad-b5f8-3483-8444-4334a03482dc@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <03a57aad-b5f8-3483-8444-4334a03482dc@roeck-us.net>
X-ClientProxiedBy: SJ0PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::16) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB7096:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b2c5ef8-3cd7-4cda-92f4-08db105a5094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0InaZRkEw7H+otEPlETj2Eu2EKz8u1HJd1tCHVGjd/t/oH+vsYII5fUoGhZBOwsDYAC/1lmPwTfX+t8zyFvL4ECm8Pe/kE0qAKYsgOY+P3tYz58An3KGBuvL7RhUZyEgbzRV71MKR93l/iUAf1SnK+KrqJeEiOxoL+BMKz4d3sf3pKZQKcRbwd3Iox14ZO65FRKx0jhev5risyJVMwFnBthiulWnSF7P+Ra3z095NVZ9Av6uwxG0ieBkZlzMSm6c5HShjQe59o63l+TmVmygDVALWERZbdlX2/gvPCeGwnHkLcz8k+91j1zz/oQy0zwUAcskWZGLcPL0iwcHxBPVF1Q4iNscudsPdGDzzOpDTgDhPNgkRGAnDEQLDYKNagj3FYsDmeQZBHTYp1MvDRXkoQWff4l/X/UswTQ5nCmFK/OjSBtonjGYARKUj5hJ0yVqvkkcxV2ymVOcF5CO4tsRgwsRqCWQ3PWsxsHu4QEwb+WZXyiUGvgG294lfu60wU2d4uzPcL38jD9bShyvDODTX7goJ+bsvkBuRiKR7TQDpHyrRB8wepQe7s5JG15bB7SLfOYyU6THG59C5UCGAYxdb9WjwuxXDQp16iTAQICuRZP25YBrVtqbYG+qHEjL8iVY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(396003)(376002)(346002)(136003)(451199018)(41300700001)(8936002)(36756003)(6916009)(2906002)(38100700002)(5660300002)(82960400001)(44832011)(186003)(6506007)(53546011)(478600001)(83380400001)(86362001)(6512007)(8676002)(6486002)(4326008)(66476007)(66556008)(6666004)(26005)(966005)(66946007)(316002)(54906003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vo8mnRhsgKDKSTLXG6jtxGe1tXi0D/Zs75Gf08v0hqLKLTFZt+P88zCqLsMR?=
 =?us-ascii?Q?gc1fbEcev3b3jX5yLlCzzN/QOy3HLu1AJEw0lFjeRsY9/SOWO+3sZA4W7s7p?=
 =?us-ascii?Q?HIg/TP9gFU/uDRvX00k9rQfrGIINfcQb6DYxgqa/cCHt9z7pHKZ3SeW4/3sh?=
 =?us-ascii?Q?fjvlnChX4CcLE7tGkO4tx6cEFnokeDh1llSCVkencaO/OO+8R+k5UaRvhTA3?=
 =?us-ascii?Q?06z/RXd8TJgLRY7Ie5BOuCKJphseHr8jrqRHLDdRt00aGOKbw+ui/JkrOch0?=
 =?us-ascii?Q?dAJremcPXzTYs1KJDMJ9MA88PlziuSX7ProPraRZ9CPD5G3KBgwjGvN4YCqi?=
 =?us-ascii?Q?8xvNeywr9GcwW1sKQBUiJ1H3fi/5evFSlaVLSqQyCkLAHhSeQzx3V9H0w1VD?=
 =?us-ascii?Q?9ZILujbyopFgvWTORBhohc3AT+sb5qEaD1Be4n1kIWaYLR05yIEKnyUY1IaO?=
 =?us-ascii?Q?U+K7Qh0spBjOKoWkFUMvUzcYhpn5guNkQAVc9eL2DSCHPCrFcb7JzvYVjKYi?=
 =?us-ascii?Q?jsC6A/odVQ9PJOipr8bJo4OHg6N44ljCJMste7gx/8qclpHeqr2KpwZ0KrUE?=
 =?us-ascii?Q?FqcJn4sYGK+0qD0fn1fhmUoU5leC7Sk4zCvE/UAFMHnlHeHsDeYBV6E79uHj?=
 =?us-ascii?Q?UCpX7l4QIgXatcJZ3Zq6HjGVXdPeKrrvx1O/gWOkvFWMELOk4USLR/2Z8Uxb?=
 =?us-ascii?Q?4tchClLfRebLzqsU8yeCvhnF/CnW7MnvfLRQp3XETyknzsT6yTBSlaDGoA5M?=
 =?us-ascii?Q?AA4XezxFsgVq2gYdzIVWTq4BapiR5EdHOp3uzH2vN+SZoohY1X0Hq/sowQTD?=
 =?us-ascii?Q?POEqK8uXhN3b7tfLl6OvzLIMtzW1nt+3BeFTIHTsZSracolkWTCBm/SULvBK?=
 =?us-ascii?Q?95lUYNJtDDL5ZqetgY6vD/F49ylpJDOHP25cnai7/2hmi/SWixwibP6H5mOE?=
 =?us-ascii?Q?QipX6zSZ2gNfHm7qfDXtXw8JMj88eCLo39wcVjvw9MELkHdatr+//PE6FQfh?=
 =?us-ascii?Q?EL4zzJpZ6y/y7hT6IiJPR5swBHLALGE/X1YTM+uRe7H/FWJlzo4KtA4KQKoD?=
 =?us-ascii?Q?Hgt1BJdA1JOwtpEZhe541xauqIxIoasEm2rY+v/wP1GQUvVqA4NkMj9pv0W/?=
 =?us-ascii?Q?A9kSY9i/o4cFKTYJGcBq8ylsSdxPhzPXw8SvYluVu10xwqO7h0CHk3XYlmZ9?=
 =?us-ascii?Q?vKHQYKXYyvgcz1TH22lqwvNufxLgTaqHQespkw1KtpP3eVtWgb6YI2h/fMlN?=
 =?us-ascii?Q?jD/O4W0QYkriSRrTK+kFr8VYYJlLEITB9Zx4Gr2Z1KSQqQvGGwq7ffxFVp5C?=
 =?us-ascii?Q?/Iqb1H6J2lpgStuBWxhE5aW2NFiZVHjgJvl0yc8rY9whqetdby8/wT5MsTzd?=
 =?us-ascii?Q?8RTfjL5OCAPLwlsb/cA9NQyutKLlsyLJutetgmFKObkwVbN18whx+caMw1ja?=
 =?us-ascii?Q?nvqazRZ7TXXpTNyTz/jN9UyWNdRfIZNXrdlg7/5yEaHuU/9cOd+gfzhHjMK+?=
 =?us-ascii?Q?WO0fAjWPa9Z8uaRkH7kChor65xiru1ca5/aWeUIwD2BhqszlmTu0yiPpSGrk?=
 =?us-ascii?Q?SVzQt7DBSNboqAsdxYohrvaCjgIdHWNgLib3jGXTqZFZVDbN5SYOyYcEZOEL?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b2c5ef8-3cd7-4cda-92f4-08db105a5094
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 20:13:49.1990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+z61hNUGOyH/iS3eNGcuCwFE/1nEQq0LNYDlyk+3iqT0LhYK5pPJU9REGjxjc6ElZIjustdDUwMP7TMFTPZrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7096
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
Cc: linux-hwmon@vger.kernel.org, Anshuman Gupta <anshuman.gupta@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 gwan-gyeong.mun@intel.com, "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 11:25:50AM -0800, Guenter Roeck wrote:
> On 2/16/23 10:57, Rodrigo Vivi wrote:
> > On Tue, Feb 14, 2023 at 07:11:16PM -0800, Dixit, Ashutosh wrote:
> > > On Mon, 13 Feb 2023 22:16:44 -0800, Guenter Roeck wrote:
> > > > 
> > > 
> > > Hi Guenter,
> > > 
> > > > On 2/13/23 21:33, Ashutosh Dixit wrote:
> > > > > On ATSM the PL1 power limit is disabled at power up. The previous uapi
> > > > > assumed that the PL1 limit is always enabled and therefore did not have a
> > > > > notion of a disabled PL1 limit. This results in erroneous PL1 limit values
> > > > > when PL1 limit is disabled. For example at power up, the disabled ATSM PL1
> > > > > limit is shown as 0 which means a low PL1 limit whereas the limit being
> > > > > disabled actually implies a high effective PL1 limit value.
> > > > > 
> > > > > To get round this problem, expose power1_max_enable as a custom hwmon
> > > > > attribute. power1_max_enable can be used in conjunction with power1_max to
> > > > > interpret power1_max (PL1 limit) values correctly. It can also be used to
> > > > > enable/disable the PL1 power limit.
> > > > > 
> > > > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > > > ---
> > > > >    .../ABI/testing/sysfs-driver-intel-i915-hwmon |  7 +++
> > > > >    drivers/gpu/drm/i915/i915_hwmon.c             | 48 +++++++++++++++++--
> > > > >    2 files changed, 51 insertions(+), 4 deletions(-)
> > > > > 
> > > > > diff --git a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > > > > index 2d6a472eef885..edd94a44b4570 100644
> > > > > --- a/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > > > > +++ b/Documentation/ABI/testing/sysfs-driver-intel-i915-hwmon
> > > > > @@ -18,6 +18,13 @@ Description:	RW. Card reactive sustained  (PL1/Tau) power limit in microwatts.
> > > > > 			Only supported for particular Intel i915 graphics
> > > > > platforms.
> > > > >    +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max_enable
> > > > 
> > > > This is not a standard hwmon attribute. The standard attribute would be
> > > > power1_enable.
> > > > 
> > > > So from hwmon perspective this is a NACK.
> > > 
> > > Thanks for the feedback. I did consider power1_enable but decided to go
> > > with the power1_max_enable custom attribute. Documentation for
> > > power1_enable says it is to "Enable or disable the sensors" but in our case
> > > we are not enabling/disabling sensors (which we don't have any ability to,
> > > neither do we expose any power measurements, only energy from which power
> > > can be derived) but enabling/disabling a "power limit" (a limit beyond
> > > which HW takes steps to limit power).
> > 
> > Hi Guenter,
> > 
> > are you okay with this explanation to release the previous 'nack'?
> > 
> 
> Not really. My suggested solution would have been to use a value of '0'
> to indicate 'disabled' and document it accordingly.
> 
> > For me it looks like this case really doesn't fit in the standard ones.
> > 
> > But also this made me wonder what are the rules for non-standard cases?
> > 
> > I couldn't find any clear guidelines in here:
> > https://docs.kernel.org/hwmon/hwmon-kernel-api.html#driver-provided-sysfs-attributes
> > 
> > We are seeing drivers around to freely use non-standard hwmon.
> 
> Yes, sure, freely. You conveniently ignore
> 
> Do not create non-standard attributes unless really needed. If you have to use
> non-standard attributes, or you believe you do, discuss it on the mailing list
> first. Either case, provide a detailed explanation why you need the non-standard
> attribute(s). Standard attributes are specified in Naming and data format
> standards for sysfs files.
> 
> from Documentation/hwmon/submitting-patches.rst.

I'm sorry for having missed this part. It is not that I ignored it, I
hadn't opened it because the title is on how to get patches
"accepted into the hwmon subsystem".

I was only reading the docs related to use hwmon in the drivers,
not yet at the point were I thought this case was generic enough
to get that *into* hwmon subsystem.

> 
> > Are we free to add non standard ones as long if doesn't fit in the defined
> > standards, or should we really limit the use and do our own thing on our own?
> > 
> 
> > I mean, for the new Xe driver I was considering to standardize everything
> > related to freq and power on top of the hwmon instead of separated sysfs
> > files. But this would mean a lot of non-standard stuff on top of a few
> > standard hwmon stuff. But I will hold this plan if you tell me that we
> > should avoid and limit the non-standard cases.
> > 
> 
> Oh, I really don't want to keep arguing, especially after your "freely"
> above. Do whatever you want, just keep it out of drivers/hwmon.

For the record, I am also not arguing. I'm just trying to understand the
rules. I believe hwmon is such a good infra and based on the basic docs
I had the impression that the expansion of non-standards was allowed
and desireable on non-standard cases and that the contribution to get
standard into hwmon would just come on things that it really looks that
more devices have in common.

> 
> Guenter
> 
