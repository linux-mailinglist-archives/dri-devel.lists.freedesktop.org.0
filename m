Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FBA7DCDB0
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 14:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E6010E4C0;
	Tue, 31 Oct 2023 13:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A06010E4C0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 13:20:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bS63x3jOaYaVmrHujbYYxbXztoheRZHu++/ywaG8feEL+V4miZGsXdP/7x+WKt4hdpoWf1i84WHow+zsncU7fi78BdxrkgdWNP+Y12+5mJftwjEYS6PRgvthZdHx1j0F+aW9WaVgm2Aanx6OkxpNPAqShT2y84ISACxHBl5w3AsUVddtuwQB+w5SLyp6Nw+Q/io4hLexGBr8VdIm7L3a9FKliR0fIt5ozR0BF5TPN458qXpLoSkdGq6dLxnd/QTdMHmc5pYvKqcN/jRqolZqZNgAwgyqAz/rBzFJkWqZ/6wukPcRsKU6h+wXCbVE6vzffow8YHoaqwExB+CSDcpwNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gweiT0V7+s/Rpot2ou1FbLFn8IqdvtaYb1pm0F5MJ6o=;
 b=DjxdZ2qQz/h7ysmNGm6YEw3XaPrMbfqr6+gTHYyJHhw4UUfQ0rDtyn60pnlwGNvP6z1c+FmeOybhiNe/hbN+BPV54orfojgdLPcapT++Zs6PO/ijijtlcjZhkEpImb8YMvxAKEmj7odEwaEZhBxoluwkEJp760hhkgE0Lf9a7exEpNbpnioi/pWAwQ4ANxpFOQvbuIOCHBba6i7ceFJdJikVWLQnHviVCmmqNjBWUp934zIsU1tHXkBfJA1K5Nn5lE1+dWJuCTVGhtE93iQ+II31dEUYs1MvI/X6L98aYO5ALKBZH+YASisT0gOFgVJuJr44dzJHzOI+Tz/yV2rpmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gweiT0V7+s/Rpot2ou1FbLFn8IqdvtaYb1pm0F5MJ6o=;
 b=Eys3s88EzmQ3ObqK0sLFco1zwTFvQS+36ct/q5+hjpucoUbCMWoh7fn6Ccks+wplfE8XCqIIR/IPAX36SBDOt5mI+JdkoLDqQdx0TtmVv5EzRXpyIyg/rfMBG9GF25rCFdFBoUd+SUwP5nyBNsawZZkDkQj72s2LUyZDAgBLfzw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH8PR12MB7025.namprd12.prod.outlook.com (2603:10b6:510:1bc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Tue, 31 Oct
 2023 13:20:56 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 13:20:55 +0000
Content-Type: multipart/alternative;
 boundary="------------tqwKVQ0kE5UYEca7qz52Q77H"
Message-ID: <e9c6af32-8d2a-4f04-9c12-1170a3aa1236@amd.com>
Date: Tue, 31 Oct 2023 14:20:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v3] drm/sched: implement dynamic job-flow
 control
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>
References: <20231026161431.5934-1-dakr@redhat.com>
 <0bc79ae3-04fe-4e85-9fd0-e8b281148390@amd.com>
 <20231027093238.2ff8172e@collabora.com>
 <ff389793-1226-49fd-b599-07dbda0b97be@amd.com>
 <20231027093943.3f0ae992@collabora.com>
 <98988459-25a8-4ee0-89d4-cb816cbc5bef@amd.com>
 <20231027102237.0cdb85af@collabora.com>
 <190e3ab7-6440-4d41-a79f-5dd4b7d3ca52@amd.com>
 <20231027121707.414810d6@collabora.com>
 <ffb8ff87-a555-42d2-aef1-a21069282227@amd.com> <ZT/uPhLK7gan61Ns@pollux>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZT/uPhLK7gan61Ns@pollux>
X-ClientProxiedBy: FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH8PR12MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c89b4a5-14af-43fc-c545-08dbda1436a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JUSbdBwjHiujD6IdFX9kYyxd4FatenIpHhOpZB7HsATfimIkpVsFka2w/zuISD1YWcHW28nut5ypThbZtJ5sUTAes4th/I70HqDDPNauXCEVTSc/C78+0Iwhdu890AnFz4usdlPvW45k4XG9boTlXQmIqttcFD6N9ARDQtNZfPhvNGi4MFkBcGYkU4ayLddLjK8Sxv93sIYKc9f6NA5atMRZYo1UKQl8bmLVwRuUiWjOjniUQjq/+KcqVpwdwUAHK7P7K4K5Y8QT7MdWh33wa/Kj4lRUKBwltE8Q52JopBj2oDSYtFU790+j/sXor97uFxeL+y/sQwBpOMO/CeA2EgX71mk45Pgiow1nulCTZSVmJ/PkcFAbAYdsW2yIqWupR3ACTIeZnrwXgdr11dj6HgL6PyWeaFQcLwC+aKSMxhmIZf/Hb11Tworhyd/9fMNLMWB8GNPzt3lkEUTmBvtFyvrTkmK5a8imdnXhXj/2/mFaVbjPq7JhOfI6I79N2CdYiQxA9t3EU1nuU40FaG1nqKiDskNDD68KFVBUF9oyY2tG2wLUClx6AnkRrJRO6KAumMMH/KFhHS0mbqOid2MID6h09Nv3Jai+M80DmwVnC9LbMavZ+QC2r0+FT4L6i6Od6INt04AsOHkdMBNbjLCGUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(136003)(376002)(396003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(66556008)(66476007)(6916009)(316002)(38100700002)(6486002)(33964004)(6512007)(478600001)(83380400001)(2616005)(36756003)(2906002)(66946007)(26005)(6506007)(41300700001)(5660300002)(8676002)(8936002)(4326008)(86362001)(31696002)(6666004)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFNHY2U4N0hmem5SeWYzYWZrcUpPTG9SckZYWlZkT3Y2NlJvSkFwZGhIcXBV?=
 =?utf-8?B?TXpHQkl4enlHRE1kQ0tEWU9LRUg0c05MMVkySDVBaCttN01pZ1Z2OFd4T2VS?=
 =?utf-8?B?S0tvWnIwMUhRcGNnbjVncHF4NDk1SStQTlFtTU0wVDk5Z05oZ1c2cmIwbTI0?=
 =?utf-8?B?VWlQdndUZWRidWFxK1BLTllKc2J6SXZwNUNraElGMjNidkcrWDdpUXIzbWo1?=
 =?utf-8?B?UEJnaG8zbFVJNGNpYyt5YVpyazZKVHRYS3U3Uiszc1NCZ1ZOQXR5cXo3eXIr?=
 =?utf-8?B?ajh3M3VqV3VVVVVHRmxnSFVITU9JT2FSR0dDM1RZZitMSjAxTytPRVd5UzhI?=
 =?utf-8?B?TkVMZmtqblI4OUVWN1pBM2xaampMRys4MDM1OWdtK0EyTU13alBaZlI1cE1Y?=
 =?utf-8?B?enppVldVcVBrV01meTJkZXZnTHM2M01DL0VQUEx1MC9kZGZGa0F1dTJBY0tt?=
 =?utf-8?B?SGpQWkt1ZkNOV2xYV2dEN21xNVQ3YlEwdlc4T0EyeVpFK3ZjaFNZTzdkSDR3?=
 =?utf-8?B?VXNOWHE2Mk5VQ2REZTRpOGdNWUlmMXhkVGk2Nkh4YWlseHBsamhrQzk1QmFE?=
 =?utf-8?B?NlNxMHFCQVJoc2Fjb3RsbHh4aTdIRUdjTG40bUI5ZEZhUVI0U3BFbytLM3BR?=
 =?utf-8?B?QWpVNjJpN3A0Y0swYlNGSFduQXNOaVdaWXVJN0hvcTZxV2puS0x5UWdnWkZV?=
 =?utf-8?B?bGpuc0ZBck1ZOEtNeHJTeEtlVkp0WVlyeDBpWGxaRXE4Ymg5N2hwSnR6Yk1V?=
 =?utf-8?B?QmJHOFhqc1doRlBjZFFmdkVIM2dzWWVuNXBGNjByTVNQdHRXK1lCWHlPM2Rv?=
 =?utf-8?B?OXZhc3kxRCt6RGNaOEtLZWgvME0yTGxra2RNMnoxQkltc3Q2ejBQMGxZLzc5?=
 =?utf-8?B?cWFzMWV6OWtRb0hUT25ReGlOalZ6TTA5dUhLTEd0YUpKMS9XNmNXdUZRdU1F?=
 =?utf-8?B?T2dlaFdKUlpyRDd2bEl4RW9kTDVQc3hNaEE0TVlFazJocDdjQWJVQmowb2l2?=
 =?utf-8?B?Ris0amJod2RHS2xqSkIxei9OWW4yWU4xcFVHb21pOFlJUWUvYUpZSU04eVFB?=
 =?utf-8?B?NDJ5b0dIL2xRdGRLQXp4VStMcFpjRGhaVHMwaWJydGdma2FVRENpbEU1WDJt?=
 =?utf-8?B?MEVaZnFoUUpJWVc3Y0cwM01YVWs4RVlDVFB4LzNLaFJveUI3ZHZjdUtBcC9D?=
 =?utf-8?B?QnFod085WU9jQ3Bjc2tYRXNHQTJ1T2RMSVdlQkFJTUFZamNoOFpTNkxoei8v?=
 =?utf-8?B?dGYrcGlyaU1VVFF1Q2EvaWRxZUZneUlqd2FTKzlqSklKdnBEbTB0SktERS90?=
 =?utf-8?B?MVJCenZGdVlyY2tPVUFQWmZsaTZ1L1JXQmlUYzF4WEF0UGI5eVBqNzFMNllk?=
 =?utf-8?B?MXJJcThtRlVYVzZmUkR1TmVxOENjNE9KajFEUk9XUkVwOTlveWhiOHBjTHF4?=
 =?utf-8?B?WDJDeW92c3p4eWRjNVlEcHFwQnl2M3ZLSXFzMysvN1RQNTdhWExLazdFOHpo?=
 =?utf-8?B?b3JmS3BtaVBOemwrOHArd0RIbHNJQVExb20veUFNRExHMW11OHh1OVFUZFZV?=
 =?utf-8?B?U1Q0dDBnVlA0WC9tdmVpVzRyOGY4YktxT0xZSEdiUm51Z2hjRDgzL2dPS3ly?=
 =?utf-8?B?SDZtYmMya201WlZkMHE5SFdJVy9rTTU4K0xQNExYZnUvU0M5MVFkeVNIcjh5?=
 =?utf-8?B?a0dNS0JRbDBUYWhjTWxCYUpVNGJRbWJJRnVQb2k1RC9rMlFSNTZMQzhrbnRE?=
 =?utf-8?B?aCtUYksvYWFZbXlVL2VCUDVtTlV5SXRHNU5Pd0RnK2xQVEczbVFkbVlod1hQ?=
 =?utf-8?B?c05jeWxzZjZEdG9VbDFUczQzTVNxQlY0QzBFNDFJNEhlSHRIYXNIR0dWTGhl?=
 =?utf-8?B?c0IrQXVtRlhGd3BUVS9nb2NQWGVKWW52QzVqaGRoZGthNUROMStnSmJMZEJ0?=
 =?utf-8?B?Zy9yb1NsV3ozdDkwa0hYakVkSU9WVUdoZVJiNDZJbVlBSWphMHJ2QXMxMEJD?=
 =?utf-8?B?MXNSUWxveFg4cDVBYzlXWmpzQzJOTzJkOFJSaFZPcTQ1c2M3Wm1vU2s4ZnR6?=
 =?utf-8?B?Tlo2OHhzNzEySGlaOExoOVdJWW5hUzBVN1dwb3Z1THlaTjZweGNhcCtoNEsz?=
 =?utf-8?Q?hKASGcNW+YTyY9qNDh7yfkP0m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c89b4a5-14af-43fc-c545-08dbda1436a2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 13:20:55.5645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6IYj1cqSVsdyX2ktFU6jgQNhaw9189DISmEyGr0GDc24FE0d6QOgQQ1hAlNDiCwP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7025
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net,
 Boris Brezillon <boris.brezillon@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------tqwKVQ0kE5UYEca7qz52Q77H
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Danilo,

sorry for splitting up the mail thread. I had to fetch this mail from my 
spam folder for some reason.

Am 30.10.23 um 18:56 schrieb Danilo Krummrich:
> Hi Christian,
>
> [SNIP]
>>> And yes, we can live with the overhead of making jobs
>>> slightly bigger than they actually are, thus potentially delaying their
>>> execution. It's just that I don't quite understand the rational behind
>>> this conservatism, as I don't really see what negative impact this extra
>>> ->update_job_credits() call in the credit checking path has, other than
>>> the slight overhead of an if-check for drivers that don't need it.
>>  From experience it showed that we should not make the scheduler more
>> complicated than necessary. And I still think that the ring buffers only
>> need to be filled enough to keep the hardware busy.
> Right, and this callback contributes to exactly that.
>
> I don't really think there is much to worry about in terms of introducing more
> complexity. The implementation behind this callback is fairly trivial - it's
> simply called right before we check whether a job fits on the ring, to fetch
> the job's actual size.
>
> I would agree if the implementation of that would be bulky, tricky and asking
> for a compromise. But, since it actually is simple and straight forward I really
> think that if we implement some kind of dynamic job-flow control it should be
> implemented as acurate as possible rather than doing it half-baked.

Yeah, I see the intention here and can perfectly relate to it it's just 
that I have prioritize other things.

Adding this callback allows for the driver to influence the job 
submission and while this might seems useful now I'm just to much of a 
burned child to do stuff like this without having a really good reason 
for it.

>> If this here has some measurable positive effect then yeah we should
>> probably do it, but as long as it's only nice to have I have some objections
>> to that.
> Can't answer this, since Nouveau doesn't support native fence waits. However, I
> guess it depends on how many native fences a job carries. So, if we'd have two
> jobs with each of them carrying a lot of native fences, but not a lot of actual
> work, I can very well imagine that over-accounting can have a measureable
> impact.

What I can imagine as well is things like the hardware or firmware is 
looking at the fullness of the ring buffer to predict how much pending 
work there is.

> I just wonder if we really want to ask for real measurements given that the
> optimization is rather trivial and cheap and we already have enough evidence
> that it makes sense conceptually.

Well that's the point I disagree on, this callback isn't trivial. If 
(for example) the driver returns a value larger than initially estimated 
for the job we can run into an endless loop.

It's just one more thing which can go boom. At bare minimum we should 
check that the value is always decreasing.

Christian.

>
> - Danilo
>
>> Regards,
>> Christian.
>>
>>> Regards,
>>>
>>> Boris

--------------tqwKVQ0kE5UYEca7qz52Q77H
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Danilo,<br>
    <br>
    sorry for splitting up the mail thread. I had to fetch this mail
    from my spam folder for some reason.<br>
    <br>
    <div class="moz-cite-prefix">Am 30.10.23 um 18:56 schrieb Danilo
      Krummrich:<br>
    </div>
    <blockquote type="cite" cite="mid:ZT%2FuPhLK7gan61Ns@pollux">
      <pre class="moz-quote-pre" wrap="">Hi Christian,

[SNIP]
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">And yes, we can live with the overhead of making jobs
slightly bigger than they actually are, thus potentially delaying their
execution. It's just that I don't quite understand the rational behind
this conservatism, as I don't really see what negative impact this extra
-&gt;update_job_credits() call in the credit checking path has, other than
the slight overhead of an if-check for drivers that don't need it.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
From experience it showed that we should not make the scheduler more
complicated than necessary. And I still think that the ring buffers only
need to be filled enough to keep the hardware busy.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Right, and this callback contributes to exactly that.

I don't really think there is much to worry about in terms of introducing more
complexity. The implementation behind this callback is fairly trivial - it's
simply called right before we check whether a job fits on the ring, to fetch
the job's actual size.

I would agree if the implementation of that would be bulky, tricky and asking
for a compromise. But, since it actually is simple and straight forward I really
think that if we implement some kind of dynamic job-flow control it should be
implemented as acurate as possible rather than doing it half-baked.</pre>
    </blockquote>
    <br>
    Yeah, I see the intention here and can perfectly relate to it it's
    just that I have prioritize other things.<br>
    <br>
    Adding this callback allows for the driver to influence the job
    submission and while this might seems useful now I'm just to much of
    a burned child to do stuff like this without having a really good
    reason for it.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZT%2FuPhLK7gan61Ns@pollux">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
If this here has some measurable positive effect then yeah we should
probably do it, but as long as it's only nice to have I have some objections
to that.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Can't answer this, since Nouveau doesn't support native fence waits. However, I
guess it depends on how many native fences a job carries. So, if we'd have two
jobs with each of them carrying a lot of native fences, but not a lot of actual
work, I can very well imagine that over-accounting can have a measureable
impact.</pre>
    </blockquote>
    <br>
    What I can imagine as well is things like the hardware or firmware
    is looking at the fullness of the ring buffer to predict how much
    pending work there is.<br>
    <br>
    <blockquote type="cite" cite="mid:ZT%2FuPhLK7gan61Ns@pollux">
      <pre class="moz-quote-pre" wrap="">
I just wonder if we really want to ask for real measurements given that the
optimization is rather trivial and cheap and we already have enough evidence
that it makes sense conceptually.</pre>
    </blockquote>
    <br>
    Well that's the point I disagree on, this callback isn't trivial. If
    (for example) the driver returns a value larger than initially
    estimated for the job we can run into an endless loop.<br>
    <br>
    It's just one more thing which can go boom. At bare minimum we
    should check that the value is always decreasing.<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:ZT%2FuPhLK7gan61Ns@pollux">
      <pre class="moz-quote-pre" wrap="">

- Danilo

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Regards,

Boris
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------tqwKVQ0kE5UYEca7qz52Q77H--
