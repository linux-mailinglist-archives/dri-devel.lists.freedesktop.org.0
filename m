Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2622FBFE9
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 20:27:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FD86E08C;
	Tue, 19 Jan 2021 19:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA376E047;
 Tue, 19 Jan 2021 19:27:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCBcsMMLyDSyXYYk1WTLMky1KSaE9GbN9S6/KnPJ+vMnnQEQ4kxSgZK9m//ju7gbZO0C5izOIDHFN6ENPEIko0hfT9XpYGynShOcLhGfqIdj+0s4xkirzq0m2wIGlVwkbKRUUY1cedMXJ2MuaXq9wh6t8QxzujU7ctvve7iFwUHJccrNgRWMtTLEGm97xznTQz+1bFYTQhhtmol7mXbUMg7ufvsJC/l1U2NAe5wnark5wdoFQh7LB/rsN9vzEJnL/lU2oOFnfej/sh78bgc01ZeTDg0LBo/ZOH3DF+Qm1eXfqGFXdwqThxragPkvIHZO69EANRtGGeaS8/gHP4SBew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDnrtRR9j27LvMFwPIOT5Za1n2bgcmBcOE5FS0gLY2s=;
 b=TtTZqCZFuM8WS5B8hhKnU5dOovhLocoUVWPOH388ZSKwpD+FGihvVhhAyBInAvFtROq5PTnptbWlxW8VnoDVrgSfjY9HSuWuI0jH0EsNSsycwedC+Efrzf4ee0KI1U3mQulA8faZ4NfzDlgqg0JBkW+677IgwB7+4U8bOxwD4xJb6HFBONpOnl9QTvVoG7NKiEXDzEl9GCHNUHqGyIkbpZ9rArqTibDf3x1Bza30QV8QUwOU3zaq9FVphcu+V48eK/aHdhQqCHKCfjrbxlL48FTnzpyTbhJV8cI+WkLX/fsUkgVJfj9GJWlo1pt5ugCBareFfobLEIZowFQlszRo8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDnrtRR9j27LvMFwPIOT5Za1n2bgcmBcOE5FS0gLY2s=;
 b=ZAl4+sQt0zar5jn5EA6g8by/J7FrZipIPisqFG9p5mZjm+7mX7PLPcskxeFoTGf3uEUFyg8GkZ0lUNF6D/YDiKiiSS0vdCq11OarVIAvbMk1TF5QL2TrlIOMXMWDrRrl1eog0aTvAo0xpl090GHHsK1YsG3swgb1aS6e1yHvZE0=
Received: from (2603:10b6:208:8f::18) by
 BLAPR05MB7378.namprd05.prod.outlook.com (2603:10b6:208:298::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.5; Tue, 19 Jan
 2021 19:27:20 +0000
Received: from BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::856b:10f9:d35c:cde1]) by BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::856b:10f9:d35c:cde1%4]) with mapi id 15.20.3784.010; Tue, 19 Jan 2021
 19:27:20 +0000
From: Zack Rusin <zackr@vmware.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/29] [Set 15] Finally rid W=1 warnings from GPU!
Thread-Topic: [PATCH 00/29] [Set 15] Finally rid W=1 warnings from GPU!
Thread-Index: AQHW62p+Afh7eg9MAECAFEwSMWQpd6opAUIAgAR7cYCAAARggIAAJLMAgAD9y4CAALfKAA==
Date: Tue, 19 Jan 2021 19:27:20 +0000
Message-ID: <8DE96253-47A3-4A16-9331-62F547A2CC44@vmware.com>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
 <F914D9B9-6DD4-4383-9F7C-8D09FBFE96CE@vmware.com>
 <YAWhDRkSOHbJ+2Le@phenom.ffwll.local> <20210118150945.GE4903@dell>
 <YAXDgmWMR9s4OgxN@phenom.ffwll.local> <20210119082927.GJ4903@dell>
In-Reply-To: <20210119082927.GJ4903@dell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.40.0.2.32)
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [71.175.59.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9ced637-eb95-498c-2bd3-08d8bcb03d9a
x-ms-traffictypediagnostic: BLAPR05MB7378:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BLAPR05MB73788F177B49E0955637FB78CEA39@BLAPR05MB7378.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bRYJYhpc5DJU0PAvR/CYJc/A3Z44dZLyfiEWEwnq6/NSU9EBSZ+woGgB57CEs0LDKtR92/e5MHo+jIo9YnUlFwvl2w13m2tV05Y79mfOMHfvSSm/sCWr1M88edkwzmGXai8+byUsDfDgnkvFCgBXMB5ednJOzolf9cVI268x5GXR54A6oB9rO+mNoZfrDbMe9Hu8ewIagCoPyuZa4l1FigoMBYtkIkWI1Ap2Hyd6ngXy/4eSqZf0XXZTccpNtWdNFjA7uxDWTL9xe6XOysbQ/RnSy4/V8h9DC0a/LLCZ7L0JUKqCKS7FXzGCrIWtTeejZWl89FjiQWDpJM2mcYCiEJ7T+xECObkUxFKgyaNVvQ7gNKn04Js9SKUuG5iOe4Ba0kYBJMT/ez7nkjqCA0vvtsTPni5iwG8GMQfBArdTNQ1tC3rqGPr6v5/PtH5pGC+r
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR05MB5186.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(83380400001)(76116006)(36756003)(2906002)(186003)(8936002)(4326008)(33656002)(316002)(54906003)(66476007)(64756008)(5660300002)(86362001)(66556008)(66446008)(53546011)(71200400001)(6916009)(6486002)(6512007)(66946007)(7416002)(478600001)(7406005)(8676002)(2616005)(26005)(6506007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?TCu+QFTEdaiUDOfB2J449+fIzZVCLxcC1gW7TEWnnI96nC+wAK8CBvfSrn?=
 =?iso-8859-1?Q?YghDRMZDhqpaTnMyzBaFahz4R8ecjYJlIB1wrYu+5Una6qdeD+aaJpeq2O?=
 =?iso-8859-1?Q?T4NKbb7pvVYkfcITQlXStEdtl3TcA1dIFzbCfIyECs/bXQmDwDDlbWrhcP?=
 =?iso-8859-1?Q?RM49Zz/8pCv2EJM2lJRveOf0dM+3k5eVOa79X+9QBMTFp8cR3unQdFKcg3?=
 =?iso-8859-1?Q?SiZ2OOi9iBTSjayrIrfq5EVgtZPwQWoNQPExcnFA58qqq9gVq0QW66gH5G?=
 =?iso-8859-1?Q?QYC5KKTknKcY1ZpdKRrAlvpv4vycllYqHxrOCGh6pXP2OSM8Y0lpIZgCV/?=
 =?iso-8859-1?Q?n3bpdoeo5WCLR2lA2ZBbsKL5yXhK4N7dkUAzMNfL+vas4jqgvSCGcp53Xh?=
 =?iso-8859-1?Q?8RWc7ROTC8C6Xp9tVcD4Bs6NhC6GsYwM+bOPSlS2pYIM/wAy9cIBYF6RaG?=
 =?iso-8859-1?Q?6BSuEM1FZopsbiov2UDwDm+lwc6xkwhvj2pXbZjQZ6uGOzOlCwmPWDmEt/?=
 =?iso-8859-1?Q?QIomay5ENR5VbaSmswwUUvZ28/1ZXqppCj5Npf0reEn4XoXADF0BvhchC9?=
 =?iso-8859-1?Q?9qd2LQdnC9qeyete3tkKd7qLkAO71Xhnt2rJPo4M8iREwRdqYCSfRmCXw3?=
 =?iso-8859-1?Q?GiVbiOWieH3ySMGrVLGBeDGnYeoxjygHWa2h+ZmqEW/wOdp2+8cQjqJDhK?=
 =?iso-8859-1?Q?hEVb0BBWBZtUZrcN0XMKhsLFfwXV/DzGenUzdYPuwp3gV3ZRx1ZQGaowyW?=
 =?iso-8859-1?Q?J7NZxq03OAmyo0xlDnm7wxMg8y3MqO4/3J8u4zt7CPmQ0vO7nbxNzZhyCN?=
 =?iso-8859-1?Q?Kodkp07tLOmxjLOKurE+IUQPn1msAp6usoesmErCxKm5BW04FklrA7jinQ?=
 =?iso-8859-1?Q?4/PQnhQGYzpvQUeiWz/bMLFVKlR99FC/yGP0Cb++tPOPbAPsyLunqYDCUt?=
 =?iso-8859-1?Q?kJ5de+Vx3U6aPiUmbrsp4RumlgEwZ8tDFehpdIKVKkNR+jEA8O6aa8n6Pv?=
 =?iso-8859-1?Q?bpWZ/hS/nwG07/7S/prnXXCjvfBPf1emVnQOWc?=
Content-ID: <F0912769F7D8344F9F5AB490350D9FA0@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR05MB5186.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ced637-eb95-498c-2bd3-08d8bcb03d9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2021 19:27:20.5425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cd3qOwYBlOAK2YzeeoHw+69w0XoGXNBx38ABzKkrIGqdoa4rnHnJzE8OioYLYnvlv40+D6zj8M77tyZTLftYVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR05MB7378
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
Cc: Jackie Li <yaodong.li@intel.com>, David Airlie <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jesse Barnes <jesse.barnes@intel.com>, Tina Zhang <tina.zhang@intel.com>,
 Jan Safrata <jan.nikitenko@gmail.com>, Gareth Hughes <gareth@valinux.com>,
 Pei Zhang <pei.zhang@intel.com>, Rob Clark <rob.clark@linaro.org>,
 Min He <min.he@intel.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Niu Bing <bing.niu@intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Kevin Tian <kevin.tian@intel.com>, jim liu <jim.liu@intel.com>,
 Roland Scheidegger <sroland@vmware.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Keith Packard <keithp@keithp.com>, Eddie Dong <eddie.dong@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Faith <faith@valinux.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ping Gao <ping.a.gao@intel.com>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 Zhiyuan Lv <zhiyuan.lv@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> On Jan 19, 2021, at 03:29, Lee Jones <lee.jones@linaro.org> wrote:
> 
> On Mon, 18 Jan 2021, Daniel Vetter wrote:
> 
>> On Mon, Jan 18, 2021 at 03:09:45PM +0000, Lee Jones wrote:
>>> On Mon, 18 Jan 2021, Daniel Vetter wrote:
>>> 
>>>> On Fri, Jan 15, 2021 at 06:27:15PM +0000, Zack Rusin wrote:
>>>>> 
>>>>>> On Jan 15, 2021, at 13:15, Lee Jones <lee.jones@linaro.org> wrote:
>>>>>> 
>>>>>> This set is part of a larger effort attempting to clean-up W=1
>>>>>> kernel builds, which are currently overwhelmingly riddled with
>>>>>> niggly little warnings.
>>>>>> 
>>>>>> Last set!  All clean after this for; Arm, Arm64, PPC, MIPS and x86.
>>>>> 
>>>>> Thanks! For all the vmwgfx bits:
>>>>> Reviewed-by: Zack Rusin <zackr@vmware.com>
>>>> 
>>>> Ok I merged everything except vmwgfx (that's for Zack) and i915/nouveau
>>>> (those generally go through other trees, pls holler if they're stuck).
>>> 
>>> Thanks Daniel, you're a superstar!
>>> 
>>> So Zack will take the vmwgfx parts?  Despite providing a R-b?
>> 
>> I only merge stuff that's defacto abandoned already. Everything else I try
>> to offload to whomever actually cares :-)
> 
> Understood.  Thanks for the explanation.
> 
> Hopefully Zack actually cares. :D

hah, I do. I just pushed all of the changes to drm-misc-next. Let me know if I missed anything. Thanks!

z


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
