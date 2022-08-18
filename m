Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C085B599534
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 08:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7146510E716;
	Fri, 19 Aug 2022 06:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.bemta33.messagelabs.com (mail1.bemta33.messagelabs.com
 [67.219.247.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37BA10E1F1;
 Thu, 18 Aug 2022 20:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
 s=Selector; t=1660854407; i=@lenovo.com;
 bh=uKwLxZyCE/LOpu2xeqALwBzA4nJQ4aAQh/0q5t3Fr8o=;
 h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
 In-Reply-To:Content-Type:Content-Transfer-Encoding;
 b=fBijKa0AFKaBiF9egCSqnCbJ5ZddhwJlMGC3WMF+NGAO2jgUVXVz/rbQCW419zO4B
 PEX89HiBi406CzRBn/Qw36jFBr7x8LikOQprPZNlHHBbY9HCLPjzfRk0KLSFBJ+p/q
 keueYpomaV/N3HVu2B+bip2UI0seysEk8ARkcD2kxgdQCErlKl5pC8KXCYkaRi7swQ
 a02idzHaIrWXNgEWQSed07EBLCfpN2xZtqPXfDlIpysoELyXDUGRCWNsK3wFqzBTxK
 gL4W6dm9Sr0meDrC/mQTOX3T8o9cyMzrL4sdbf9QCIeIFsvViHuHCZd+iszFcNTxFb
 tTfoawSbA3DVg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGLsWRWlGSWpSXmKPExsWSoS+Vq9u24F+
 SwZZtIha9504yWfzfNpHZ4srX92wWb45PZ7LoWr2TxWL2hM1MFssvr2e02LuQyeJf9zI2i8u7
 5rBZTN3dz2qxf9Y1dovj/6osvv8DSt5cuoHdgd9jVkMvm8febwtYPFqOvGX1WLznJZPH9m8PW
 D3mnQz0uN99nMnj/b6rbB6fN8kFcEaxZuYl5VcksGasvH6WuaBXtWLnh8dMDYwb5boYuTgYBZ
 YyS7zbf4INwlnEKrF+9RQop5NJYlH3TDBHSGAOk8TWQ4uYIJwDTBJLXu5l7mLk5JAQOM4o0b3
 KHSLRySixe+sPqJaJTBLzX7azQjhPGCWezINxHjFKLPq6jAWkn1fAVuLvgQlgs1gEVCUW7mlh
 h4gLSpyc+QSsRlQgQqJ34h9GEFtYIFaifcorsDizgLjErSfzmUBsEQE/iUm3F4AtYBb4wyxxa
 N5OqDseM0l8+98PtoFNQFtiy5ZfbCA2p4CHxP39DawQkzQlWrf/Zoew5SW2v50DVi8koCzxq/
 881KcKEjeOTWKDsBMkmqccZYSwJSWu3bzADmHLShw9O4cFwvaV2DB9P1RcX+Lgw29MELacxKn
 ec1C2vMTOjbdZJjDqzELy9Cwkz81Cct4sJOctYGRZxWidVJSZnlGSm5iZo2toYKBraGiia2ap
 a2RsppdYpZuoV1qsm5pYXKJrpJdYXqyXWlysV1yZm5yTopeXWrKJEZhEU4pc3+xgfL7ip94hR
 kkOJiVR3vqIf0lCfEn5KZUZicUZ8UWlOanFhxhlODiUJHib5gDlBItS01Mr0jJzgAkdJi3Bwa
 Mkwls1CSjNW1yQmFucmQ6ROsWoy3Fl2969zEIsefl5qVLivM1zgYoEQIoySvPgRsCyyyVGWSl
 hXkYGBgYhnoLUotzMElT5V4ziHIxKwrwiIFN4MvNK4Da9AjqCCeiIYxd/gxxRkoiQkmpg2rD0
 lIxKpVJJy8QpQt4Gd6SMZIP+qMj3bvSVPXNavfrmS2HHjdnbMlMb6iJYmm8ePaPAtT9AJfL+m
 mdcj0oaZF4ySeR5MerUzi+pSyjY1TNVhJer9OKOn0lGYQURca8fql39pPPOS9j0iYCb5LvCil
 WfHa61Z7zsKvtaMOtVbP79skvmiltniazXNVScq7z8ymr5V34Hpq64fnil2IxakbYztnZOt+r
 YrYI6y3b5zjX4lbdhJktirVn5oSveMxozzrkc6+BMj7Tl+fhw93fDGYW+tT1Tcp7Y+zTNMHu9
 yyTqptP0zEdn6y5FWCVaahdErW7bLV59rFqAKflsV42LweMPK71cJacanjb5oq7EUpyRaKjFX
 FScCACTpylnqQQAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-6.tower-635.messagelabs.com!1660854404!26269!1
X-Originating-IP: [104.47.26.109]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10821 invoked from network); 18 Aug 2022 20:26:46 -0000
Received: from mail-sgaapc01lp2109.outbound.protection.outlook.com (HELO
 APC01-SG2-obe.outbound.protection.outlook.com) (104.47.26.109)
 by server-6.tower-635.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Aug 2022 20:26:46 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bACtUakNOdzdc92sRnPuPBe+K3T335xZyq0txvYF1ckWcBjppugmhhbohqnynqyYxtZy6etDmdfq7dBTlMMkeeDMOVfC947KuD4lPWREUALjSN7wvjUMDBEfoLBRfwa/ELaPQ7TWIuGoabeLuQWy6XfSf5AmKwxzy5po0gYz20qPa4giZQpvTYNrr0QX82fAxs3JBdC03r5ES3et790A74PEBkEFA5CSV5OgAGlMQDEO3GjgZZO84sYA8F9Ri+8GicgI7sIYyaFPP/GdK4t3EIHZ6Tb2F+Cl9RAajVPi757T6b+ZmCWreSZv1p6d5KEI64QmbpJjCizVTOkxqdHTdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKwLxZyCE/LOpu2xeqALwBzA4nJQ4aAQh/0q5t3Fr8o=;
 b=lCFONGxy6PztIY0Fmwj0tbCVBfoq3nUw6vf/6fjLixnIbVmVKoCYNyT3yRHHq40On+64yrGezhwTSJLHmCM8YGz9sXUpElYu9XKKZ5dcYVw7uuh+bf3x7IvtATaeN+mPPco3RFN0PBoFC025jmRjOx6eHAbfYT+SbJpkfUsd+jy36+n00b85/JSKnxIdkwrZGgJHmTl6LbtHeqBQDKHQog+CsJfI1jsbteKm53IO4K27EIvWP1umj7NHSCSCKnDU5YBQPsPwIz3GLxZx+WtU2BVrQRqkCVq2Mecm3Xe1KNmKvbA9V4FvefYmRQBY0WjodHL3U2hrPIZd+XwoJnJw6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SGBP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::18) by
 KL1PR0302MB5252.apcprd03.prod.outlook.com (2603:1096:820:4d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.4; Thu, 18 Aug
 2022 20:26:41 +0000
Received: from SG2APC01FT0045.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:b0:cafe::6d) by SGBP274CA0006.outlook.office365.com
 (2603:1096:4:b0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16 via Frontend
 Transport; Thu, 18 Aug 2022 20:26:41 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 SG2APC01FT0045.mail.protection.outlook.com (10.13.36.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Thu, 18 Aug 2022 20:26:41 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.28; Thu, 18 Aug
 2022 16:26:39 -0400
Received: from [10.38.97.152] (10.38.97.152) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.28; Thu, 18 Aug
 2022 16:26:37 -0400
Message-ID: <dafc2f05-c611-417e-be22-e8f1a4644f35@lenovo.com>
Date: Thu, 18 Aug 2022 16:26:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [External] Re: [PATCH] drm/i915: Switch TGL-H DP-IN to dGFX when
 it's supported
Content-Language: en-US
To: Lyude Paul <lyude@redhat.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <20220816025217.618181-1-kai.heng.feng@canonical.com>
 <87leror4sl.fsf@intel.com>
 <CAAd53p76ut7QRFdM4NjaRua=Hc4bu9_=7+Q_t8ExJysEAhJf=Q@mail.gmail.com>
 <b8ebc447ea464371102df765882fc5010cc0c784.camel@redhat.com>
 <CAAd53p4GoU6_ExWB=0b3_X7STd2Fnq764QpmzgOEwn3jdCUBxQ@mail.gmail.com>
 <35d4da2537d53ade88528dda5668f5b5d2b21e49.camel@redhat.com>
From: Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <35d4da2537d53ade88528dda5668f5b5d2b21e49.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.97.152]
X-ClientProxiedBy: reswpmail01.lenovo.com (10.62.32.20) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55983055-3855-44d5-c442-08da8157f61d
X-MS-TrafficTypeDiagnostic: KL1PR0302MB5252:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j0t38cJrc7SzmPxIe8XGVbZ7b9pG/kT6d7kNfb4mYS9POXGgsXldjYBB9dp5CUR2RxrRlowssKJMU5wnH7qDPWW/+dpY5ILP90d6KPkPy+6D9Q454UjfUNoUfOuZCJMR4Z1xIWl6JRWsIC2QEeIPQ0pF95dKNg84TyoOHVtNYK7G8EMDBtM/GeUKmqf9vI2BKGnjTMtnn9GBURhDZfhtbMvidKa5m0qqKr11xCoubaG0szjzP6ZTg2M+4QIPg5JoOUdZys0XCYvfJQB30Mz9Td1DetYaANtRuhaznx0Lydqy++6BuQFyja56U09sfrh8zfIdzHno6feQCS7gjCAR0YRMBz2ocuJAK/FLYuKEwQpG/pmJ0FUT3aHgPhkThm2uqJCVTo5zBsHnqoTI6R8QMYPWe6jBOMi44hrtO9YFyiNUtvbm/vCN9BlCnZAf2sEXVfxP8Yr6uPHk0I6OabCHGQpldDdHbNJo8/5Me69r5+977gjRjEv9OBUL/9FM3zL7frJdg+y56+WRBEMLtV83AiLKqA/HGPK8AnkfjlyOYsj9x0AoIFVw38NIEestSIl/K7fH31dz8+sL8TSoQDt2wEem0VQO+KxpYMdV8d/LIGgUp9g9q58/xzDr/SBN2cqrpoOwu5fWfaeQtXcl1TJP75ZjZ9rv4l7wVkUFY9Ztd/eKtDzuWIeSv/t18/H0iMlzUacaJoRwOR0bby0SQT3fHDBQ6BJI19Jy1FMKegdmSIOtEzirPwPpAmhyaVHZuGJwuD1UpTPlFCkZsf0a7+5O5kJGRCyLC2ot2KtC7t+4U/wVdSl385UQIAFR1TANkuoel8mAYF7HAuGnBEo5PBydpa3IFehUln9OYlRdePsSdqI=
X-Forefront-Antispam-Report: CIP:104.232.225.6; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.lenovo.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(39860400002)(396003)(84040400005)(36840700001)(40470700004)(46966006)(36860700001)(83380400001)(47076005)(16526019)(26005)(53546011)(2616005)(966005)(31686004)(478600001)(8676002)(316002)(36906005)(54906003)(110136005)(70586007)(41300700001)(16576012)(70206006)(40480700001)(5660300002)(2906002)(82310400005)(7416002)(36756003)(8936002)(4326008)(81166007)(356005)(336012)(426003)(186003)(82740400003)(82960400001)(40460700003)(31696002)(86362001)(3940600001)(43740500002)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 20:26:41.2474 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55983055-3855-44d5-c442-08da8157f61d
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203; Ip=[104.232.225.6];
 Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT0045.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0302MB5252
X-Mailman-Approved-At: Fri, 19 Aug 2022 06:20:23 +0000
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
Cc: tvrtko.ursulin@linux.intel.com,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hans de
 Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com, Zenghui Yu <yuzenghui@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>




On 2022-08-17 13:56, Lyude Paul wrote:
> Adding Mark Pearson from Lenovo to this, Mark for reference the original patch
> is here:
> 
> https://patchwork.freedesktop.org/patch/497807/?series=107312&rev=1>> 
> Comments from me down below
> 
> On Wed, 2022-08-17 at 09:02 +0800, Kai-Heng Feng wrote:
>> On Wed, Aug 17, 2022 at 2:24 AM Lyude Paul <lyude@redhat.com> wrote:
>>>
>>> On Tue, 2022-08-16 at 19:29 +0800, Kai-Heng Feng wrote:
>>>> On Tue, Aug 16, 2022 at 4:06 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>>>>
>>>>> On Tue, 16 Aug 2022, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
>>>>>> On mobile workstations like HP ZBook Fury G8, iGFX's DP-IN can switch to
>>>>>> dGFX so external monitors are routed to dGFX, and more monitors can be
>>>>>> supported as result.
>>>>>>
>>>>>> To switch the DP-IN to dGFX, the driver needs to invoke _DSM function 20
>>>>>> on intel_dsm_guid2. This method is described in Intel document 632107.
>>>
>>> Is this documentation released anywhere? We've been wondering about these
>>> interfaces for quite a long time, and it would be good to know if there's docs
>>> for this we haven't really been seeing.
>>>
>>>>>
>>>>> Is this the policy decision that we want to unconditionally make,
>>>>> though?
>>>>
>>>> I believes so, so more external monitors can be supported at the same time.
>>>>
>>>> Kai-Heng
>>>
>>> Is this for systems with dual Intel GPUs? I ask because if this affects
>>> Intel/Nvidia hybrid systems then this is a huge no from me. Nouveau is able to
>>> support these systems, but at a limited capacity. This would imply that we are
>>> making external displays work for users of the nvidia proprietary driver, at
>>> the expense making external display support for mainline kernel users
>>> substantially worse for people who are using the mainline kernel. Which isn't
>>> a choice we should be making, because nvidia's OOT driver is not a mainline
>>> kernel driver.
>>
>> Yes it's for Intel/NVIDIA hybrid systems.
>>
>> The problem is that hardware vendor design the systems to use NVIDIA
>> for external displays, so using external displays on Intel are never
>> tested by the vendors.
>> I don't think that's any good either.
>>
> 
> Sigh, the constant forcing of nvidia hardware into laptops from vendors is
> seriously something I wish they would knock it off with considering they're
> basically the most difficult hardware vendor to work with.
> 
> Anyway, if we -need- to route displays through the external GPU then we can.
> But I'd like to at least get convinced first that this is an actual necessity
> we should expect for multiple vendors, or the exception to the rule. Because
> if these laptops are capable of driving displays through Intel, at the moment
> not doing that is a huge downgrade in terms of functionality. -Especially- if
> these machines were already working in the field as-is. Probably worth noting
> I don't think I have yet to actually hear of any complaints about this being
> the case, and I'd like to also make sure this isn't a change being done for
> one or two vendors when most vendors aren't actually doing something like
> this.
> 
> Note that for a lot of systems it won't -technically- be a big difference
> since the current situation in the market right now is that a lot of laptops
> will have all their external displays routed through the nvidia GPU and
> nowhere else. It's not great compared to just being able to use the well
> supported Intel GPU for everything though. And if we're controlling display
> routing through ACPI, that implies things aren't directly hooked up and
> someone went through the hassle of adding a display mux - which kind of seems
> like a waste of engineering effort and money if it can't actually be used for
> muxing between the two GPUs. Especially considering that up until very
> recently muxes had more or less been dropped from the majority of laptop
> vendors (I think Dell was an exception for this fwiw).
> 
> Mark, since you're from Lenovo can you help to confirm this as well?

I'll have to do some checking for this years models and get back to you
I know on last years that we had a HW mux available on the P1. There
wasn't one on the P17 (and I'm not sure about the P15).

My understanding is the Intel display just wasn't available at all
for external display on the P17 (and I do agree with your comments on
the wiseness of this!). I believe it was hardwired with no way to switch
it - we lost a sale from this, and if there had been an alternative we
would have pursued it.
I'll confirm with the HW/FW team.

We also have lots of users on Legion gaming systems - but unfortunately I
don't know what happens on those platforms as they're not in our Linux
program.

Mark
