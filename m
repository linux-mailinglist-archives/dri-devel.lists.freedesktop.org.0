Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9342E837AEC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 01:56:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CA310F217;
	Tue, 23 Jan 2024 00:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C936910F225
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 00:56:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S6JWjlLfQgzNO5+Oj77IjeJrlRzh48+rv72Zt9H92mDNAjTRVO1Y3Ug71QsFkxU1FQM6U7L8HQAFmAohBniswamX7oddJcZAO+dUmdyQcIxT+ms9keNDk7s9qNInNtnBkaxw8n+/UomR2BCHm2BuDE526uUIDCWroNXZ6BrSnpm6O6RYLsLRIauhLwnTRbIbvu90kHe8x2a0vl6tQ4WkFvXD3e8vxEIi7e/+eoZ2ieQwuKb1c7rppn/sBjGvN8nnamG3735o680bqITSyJ+Cuwf422RpeeruM947KxA9mN8fiI9DF1KK+wCuStXJsU71pM2V1U0Hq6NJvlr7mcdf3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4IPpm1O230KXqRyY/xMLvxUvSWGDfeOhZ7N8uONrauk=;
 b=K0JHaSIhoKMub56z3BB2mYxg/zieUw899IYPDqizmYDjMH5IjxPz9Xl1CQxMsQtu73HH2AAFAwBilaGOy1aUkWz30tMfMM3p6BsTyUl6OCjLqpwzusU7QW0iGRT1Q635KD/exGQmVIB9qKgYRpVYxC5XXs9eRDokUQZC3pEb9KfTIoFGh8ASYGykLzUP2p/wG7rLLRN8q8NJNGSGD0b5rcF6qRzwd8tWYhvNpCU9shyKBreU1dSUQEro1MQsdnMpOxeJz5BSqbCM63apiWFnr8IFG/TwK+fO05UTWC0+ut+FujuW/R43/MHkmfkbzoodZwdx0ub8Vfvd5qi5ZchFBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4IPpm1O230KXqRyY/xMLvxUvSWGDfeOhZ7N8uONrauk=;
 b=tkBtQC4vE9tIngimEW3sbfNQfEsUnQceeMPdayU9FldWSLMSzhxGSaTX30FJFDq5Pk5eH9r6Qec+jkuu1oHYOE45zcY0EvyXGLI6h65hj3l5bkNduiV21FAgyjnd5FDu47KtyBss5tZUc0rEqgB5s6s7/P9jQRb2PoL05j6SFU0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB5933.namprd12.prod.outlook.com (2603:10b6:8:7c::14) by
 CY8PR12MB7436.namprd12.prod.outlook.com (2603:10b6:930:50::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.34; Tue, 23 Jan 2024 00:56:11 +0000
Received: from DS7PR12MB5933.namprd12.prod.outlook.com
 ([fe80::5704:c345:989b:8095]) by DS7PR12MB5933.namprd12.prod.outlook.com
 ([fe80::5704:c345:989b:8095%7]) with mapi id 15.20.7202.031; Tue, 23 Jan 2024
 00:56:10 +0000
Content-Type: multipart/alternative;
 boundary="------------wJggB8uLFvkZSqw1za8nk8IQ"
Message-ID: <27c3d1e9-5933-47a9-9c33-ff8ec13f40d3@amd.com>
Date: Mon, 22 Jan 2024 19:56:08 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] BUG: kernel NULL pointer dereference at ttm_device_init+0xb4
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>
References: <20240122180605.28daf23a@gandalf.local.home>
 <20240122181547.16b029d6@gandalf.local.home>
 <20240122181901.05a3b9ab@gandalf.local.home>
 <CAHk-=whry+-JUDiiCkDkDn2TDg7SA5OvZpPbcQ_jkM_J5=ySdA@mail.gmail.com>
Content-Language: en-US
From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>
In-Reply-To: <CAHk-=whry+-JUDiiCkDkDn2TDg7SA5OvZpPbcQ_jkM_J5=ySdA@mail.gmail.com>
X-ClientProxiedBy: YQXP288CA0022.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::33) To DS7PR12MB5933.namprd12.prod.outlook.com
 (2603:10b6:8:7c::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB5933:EE_|CY8PR12MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: 462d1ba9-2c8c-472c-e136-08dc1bae173a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 44zT9ud/N4sEgd6NCLxqgmaTUlSAL3+UA1BSxESFPcWdOVI8rq8umhb0CSEUHBKAlyr6zDru6gtfQebftpGfLxbn6WxD1YLbsB1FmqHudI9Sxs17n20b+fW6JEPFYxyu017EwvjjXNsKDqKxHuPS0PdnlUzetylR+UUnh3+JvAJRhzp5D9SfxDY54cX96J9O42modd9xFXvddA29J5fSXponIx02VQtbC6qxOjbl3yqKU3OVa4nVmDkkVLRmZuo+/o/bH9dCbBMifqhvSo7jWEM3PSkscneN0lTfdEzYV0ysn25eqt9QyXCRaG+3kEsm/ILlRyx6HTHukHJhYyWryaPFxwcad6brP+k9KaLBO5McJNUDXhIg2PLOZUvq9abORihHfjxd88LEuxfYd6VOMuqSBQ9O+z8YkVq5CCVWIcCnRMLOFCEq1kANU0ofwSqIShSBHijHlpsdqx3tfMfZG8BPXN2FfBVGYTHgKEDT35uaK9qRopNS8Y49jc8WcgvZxrrsdTvNOi+vTetRl6LarnPwqP0E5Nn76XDk9Du6YjJnmslJNWpxxzUZFHsWMtP94byU0L0wtqv/Jv0pX1TY6VYcbYG7eiF4WeUAv4lfGx8oVSQdku7LNn6gBhCHGcpxqGf4NzxlWfhZlCH8leiAmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB5933.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(39860400002)(366004)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(31686004)(4326008)(2616005)(6486002)(26005)(6506007)(6512007)(478600001)(41300700001)(21615005)(38100700002)(316002)(86362001)(36756003)(53546011)(33964004)(166002)(31696002)(110136005)(2906002)(8936002)(8676002)(66476007)(66946007)(66556008)(54906003)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGpFS2lua2hGZFF4aW4xdzNHcUFjVXBvaXFqcjRLL2w1S0UxQ0lxNWc2MFVK?=
 =?utf-8?B?WnhyN084ODdLQmZIOFJEbEdXejR2V25Ta1EyWGp1aGJvUTcwU3Rwa3VmT2xy?=
 =?utf-8?B?NmhidG5VZkEzaGdiRUV0akk0cmpZMnU4RmtCcmN1UTFFQU5PNXhYRlhxcHFu?=
 =?utf-8?B?SnNndEZNRTBWMVJKZU1RekplV1hFb3IvMjN5d0w5THZZMldoaXFCK2Q2SzQz?=
 =?utf-8?B?cVZKMWlpNXltSG4yTGZ5SUJXKzZ6M09NWThwR2VSVmdNWTl3ZnlXVjhPTFpR?=
 =?utf-8?B?enh0Rnl1TEEyRHJwMHdTU2pseU1vSG1oM0tDOThZbnk1SFljeUJPVmlhSzZY?=
 =?utf-8?B?YTdvaHpWb1BVYjhlYUtRbHB2WExWdEowcU95OHp6b1RmSkwxYmo3WDhzTENv?=
 =?utf-8?B?V09VOFJ3ZnFUVFBqSXRoYnFDaG05dzhBMTk0a1ZCelZqSC9PMlc2T1h5QjBk?=
 =?utf-8?B?RCtqMVU1VFl5N1VHdGRaWVc5RWVTSnE2b0d5cTJyOC9TYmNuNlF0SmpzRlJS?=
 =?utf-8?B?K0ZoVEMxUy9QWFppdU5aSnR4eGw5TnJHNkRRdWNrbnJwdjVhS3NWQU9EUm5i?=
 =?utf-8?B?Y0ZEUFMwQU4rSzRpQnl4L2ZPQXlrYk95L1RDZmhrY1V0ajgzbnIvc1QrYXkw?=
 =?utf-8?B?K1hQcTl6YVpTaFFoVGorbkZyMDhMUHlUSlR1RnRYUERIUmJNSTkyVjJaVStC?=
 =?utf-8?B?K1hvT1gyakE0ejhyQWxqamJNeTNaL0M2N2lENnF6WFlLRUVsTHh3NWJFNGJK?=
 =?utf-8?B?SCt0Tjhnc2tacllsTFErVEpzUVZMZXNFeklHdGFDc0tSdWlMSmkzb29Qa2Np?=
 =?utf-8?B?VTU3ZUdGbFBoMWN6aHltbjRmUVdhNFZtcXVpOEZOZnkzdlFSbHl5R3JrZGsy?=
 =?utf-8?B?QkU1eU1zRkwrWDM2M1EzTWpDMmozTnNEYmY0NXBhUlI2bGpuRXpnL0xNY09N?=
 =?utf-8?B?L3JqeEtiR2VFWUlCM25pVFZDUlRCbDVYeTRWa2txbEEyMWNvSFJKdzBaUG5r?=
 =?utf-8?B?VWx4MXhURlJ3ald0Yjg4VzNIU1BRTlFaa1dXeTl0andmYjBKaWpYWEFwMDZ5?=
 =?utf-8?B?Mm9uZVBhd2NtT3JVWVZwUzlCMzlES1p0aGp3bEd3cForNTViSGlueDRQOFlj?=
 =?utf-8?B?SjlLQ0VMdmNUUVI1ODlkeG5nN3N4UkpqVDhjL1ROQVM2bFMrSFZqMzlPaWJh?=
 =?utf-8?B?NER3SDlpVSsrbEVYY2RMclZpMFNiVlNTUlR4Nk5ZaXVQWnNrWmJIbmRMVVRE?=
 =?utf-8?B?Ti9uMkZNd3FaNlZpOE12eU5NU2Y0WGFZcVdUSnhxY250azQvVi9heHpFVXNJ?=
 =?utf-8?B?dUwwVWlDdU5EdUxOaVpVai9HQ0VTV3ZMSGRPWmZoaWEvSGxBZWw3ZzhnUjNq?=
 =?utf-8?B?aUlxK3Njc1FsVGVuOFVna1FjWnUxM2M4b21yeXNwYU5WODNGV050M084T0dz?=
 =?utf-8?B?RmkyNjFtTHpzZVYyaHNqVklYTFFhcnhjOFg4dHl5cWpaZlJyRExPd0hUbUYy?=
 =?utf-8?B?KzNhVUVxR2IrOG1VU1JVOU5nMXVwTmt1bDhwR2RFSXBpdk0yUnloT3N0cHJH?=
 =?utf-8?B?QVBhWGxBNXZqenF3VDhXKzNJVG9uM3BjZ3Y4NnR2WG5KUDVnclZxZEx6S1Zj?=
 =?utf-8?B?angyZ0VTczM2QU5IQytPYnNpaGMzTTRCTStpSVFWc3RXYUloZ1dCeGtVQ21M?=
 =?utf-8?B?aFczcDhHSVpLMzJSWEFTbHpFdHl6c0xUVHprRUJYK041NTFMdW8xTTRWSzJw?=
 =?utf-8?B?VkpGVFJVZldLY3ZzOExCb1MvTTQrUGc4L1IxRW1PdEpDNWZCUnpDQVVFNHZM?=
 =?utf-8?B?aDlEQU00QkxVWFpqMFZaVDRSSXVnbEdEeGdlckxhQS9nQUZiSXMzNTZTVkRK?=
 =?utf-8?B?ekZvSEZGSElsendLbmd5dTJ2RUZianpvRzc1Z3RyNjJ5STIvU3QrRVBjUVE3?=
 =?utf-8?B?N2NFVzhkT3Roc2JscEp3c1VKRUV5NC8ySG1ocFBoMmxONlF0THVkWFNlYzA1?=
 =?utf-8?B?M0UzVmNXVzl1Sm1PNHdqMlN4cU4ybFlHRUtvODRKMjloVU9md1pUb2pSR1J2?=
 =?utf-8?B?MmNwNUhuOGw4MVBBR2svakRjbUZYODhlSnUrN0k5NU8yTS9EcGxjQUF5WDlk?=
 =?utf-8?Q?q8pdvoz3EkIV6h+Kz3/lvzmQI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 462d1ba9-2c8c-472c-e136-08dc1bae173a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5933.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 00:56:10.8869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rn9QLR0rUA9ZiuwC56Z01BeJ1x6XOpMvsP/EGcAkKiyOiN981cP+raF47wYTFGNIVB3uLDssECfMLtbR4/v8HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7436
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------wJggB8uLFvkZSqw1za8nk8IQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/22/2024 7:43 PM, Linus Torvalds wrote:
> On Mon, 22 Jan 2024 at 15:17, Steven Rostedt<rostedt@goodmis.org>  wrote:
>> Perhaps this is the real fix?
> If you send a signed-off version, I'll apply it asap.


I think a fix might already be in flight. Please see Linux-Kernel 
Archive: Re: [PATCH] drm/ttm: fix ttm pool initialization for 
no-dma-device drivers (iu.edu) 
<https://lkml.iu.edu/hypermail/linux/kernel/2401.1/06778.html>


>
> Thanks,
>                   Linus
--------------wJggB8uLFvkZSqw1za8nk8IQ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/22/2024 7:43 PM, Linus Torvalds
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAHk-=whry+-JUDiiCkDkDn2TDg7SA5OvZpPbcQ_jkM_J5=ySdA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Mon, 22 Jan 2024 at 15:17, Steven Rostedt <a class="moz-txt-link-rfc2396E" href="mailto:rostedt@goodmis.org">&lt;rostedt@goodmis.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Perhaps this is the real fix?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If you send a signed-off version, I'll apply it asap.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>I think a fix might already be in flight. Please see&nbsp; <a href="https://lkml.iu.edu/hypermail/linux/kernel/2401.1/06778.html">Linux-Kernel
        Archive: Re: [PATCH] drm/ttm: fix ttm pool initialization for
        no-dma-device drivers (iu.edu)</a> <br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CAHk-=whry+-JUDiiCkDkDn2TDg7SA5OvZpPbcQ_jkM_J5=ySdA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Thanks,
                 Linus
</pre>
    </blockquote>
  </body>
</html>

--------------wJggB8uLFvkZSqw1za8nk8IQ--
