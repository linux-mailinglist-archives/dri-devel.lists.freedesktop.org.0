Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C237E0009
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 10:36:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF73210E53C;
	Fri,  3 Nov 2023 09:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2065.outbound.protection.outlook.com [40.107.96.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8242510E53C;
 Fri,  3 Nov 2023 09:36:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+rYoW3j+Ofivclezsy2TD5HH2wzbqd7NcBfx+UG/BmNrHRVtDXi8A9jJgwiy/U1oP4ERd0FAbrFHXXlkTegXsiOYgo2S6IF0oLp1JmDpLEJc0/w9jcq844jojADvVa9tejPmcUlBzTCpKVOMIvf7C//bMkoilJ5kHpQkRaQZMupFDz9RrAbw0ZLmdVUSV3ZStX+u0Vyr6DyT3+RCYF2XBKnA3qvFr+EcYcGJ4S6ycjy4zNwuQkTI8wAaOlIMgkeGrLZ8G7OsP6ebz/jdQKfnkshbHzLKaChM6eLVP/DEGK5eJYNJRI2xH6fzl4eWNxe+fZATAhnTp84AnLN0b7KtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62K7wgdSZR+StBwWIb/QJOeV8ntdSIg904/4cuH7B0Q=;
 b=ZfLIonUfjrPoFL4LqwB33mIAnFu/+71K/ofnStGAdMku9LI0IrEl/jwrvWgq5VEMO7PO6+AaSFCHDWKNNTUqrWCi5k8/JFxaT5pWfZdvJD0TwqAPUuarYwHhk8vxN3czlCJ1CTFFmtY6UJqTwFXxG5sFYbMlDvxVkOKhQnyrjtbrgLay8JyaeEzTs1bBdGKwQfcahj3vLC8ojUhD2RKfXAcchLCr4K2SgJzkLerGwaxoLX4Ts2vsKfmlM/DpVl8aJUyR6pFj8civn2oxx3i21DeibduQsUTsRJNWo7LPyKRciLNOft33vyHgmAK9DDpy2gxYKul5Jb4jMbmLeUM/RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62K7wgdSZR+StBwWIb/QJOeV8ntdSIg904/4cuH7B0Q=;
 b=XkSx0+i9laYJeEpQrUTDcY0xLomkosQpTW/6NUIv19XvYlU8XG0q9bM2HLgDZE7kwwmOnp5/+9/+duP+UOrtqainfWcqbborYrcWBX/FczpeeQTGKZUNZxVi41GPwv7CLrWSHDChVwiwoIOLfXxpy20Jhb+7tTjE7pVzSj5Sq7w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH8PR12MB7352.namprd12.prod.outlook.com (2603:10b6:510:214::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 09:36:09 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 09:36:09 +0000
Content-Type: multipart/alternative;
 boundary="------------9yShrP0U1OuWevZjI27Q380R"
Message-ID: <547cdd55-62f4-44d2-b960-07dd83892883@amd.com>
Date: Fri, 3 Nov 2023 10:36:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 03/11] drm: introduce drm evictable LRU
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231102043306.2931989-1-oak.zeng@intel.com>
 <20231102043306.2931989-4-oak.zeng@intel.com>
 <0c2d2b4f-54a2-4a60-8f51-4ec06a629f4a@amd.com>
 <SA1PR11MB69911CED830F657F608BC52392A5A@SA1PR11MB6991.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <SA1PR11MB69911CED830F657F608BC52392A5A@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: FR4P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH8PR12MB7352:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bdb050d-c6c4-42ce-99f0-08dbdc504f47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XhXO5Yjj0mc7F1CqGZGaSlYVKeNIwJ3RppN7waPzHfMgKY6Hog1DaPGsr2mDxCRm2U5kUdc/VYx+VbJalVuGrgzdrxVd1QnQMQoAKizIjvkmQJGM+VF1zprFc16KT0qF7kUFGB7pK4j+ybqeNog018o2pI5EWKc3UPEnpguaz+PndByAQzC8tJlsnZz7K9++Cdh1L0OSzY7dj4jSHK+deCf7oSNrVbFU1ZEaEwdt+HUukAWboDD/EaSN7YkpCPS7yd9JZ/MN9PdK7i3Rx5wK4d0qmEVtIO5rlonPCQZlHuL8BkfJvwpU7fOujoyUZ9xAMJaYr/THSfpO2V1QJI3wKYs5BDLFXl0meDNJifLwgJIky8s1QJfXlhUnnzjqlIiYoeQZdJGxwZLk2KJrx10/4iguSxkeXTJpaaT/tJCk7k+5TkLatpJskz4SpcfpUxALtA5oGB8MNelV2fblW6n4TqUJqMj29smIHgUKSFTInX2w4sXcc18yrqvW8rtnzozAkrYzh3x/vT3oyHEZ3Z4ZaROXSpG63fc4j6RWmbOMY0ROnCu404HOCdyBY8puGlDueZHjafbz1iZ4ynHrIumHBj1onxnMMMu9TtiAPMUeU7f/HyXcXlkFcZFtXgA0/H1QrkrISvYUFI2q5qlMg9DpiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(366004)(346002)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(31686004)(31696002)(5660300002)(2906002)(86362001)(6512007)(83380400001)(26005)(38100700002)(2616005)(6506007)(33964004)(6486002)(478600001)(6666004)(36756003)(41300700001)(66946007)(316002)(110136005)(66476007)(4326008)(66556008)(8936002)(54906003)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE9UL2h2R25nMUc2eGkzZnRqakZYajNhMzA1MFl3Z1RxcDBXd3pSSDVodWZL?=
 =?utf-8?B?aFRoN25nSXF4MkNwVFJlNW54TmxZbHphUXJFeVZ3SlhneW9QL1VZemVFR1hH?=
 =?utf-8?B?SHQ2YTBMVWJiNVhJZ09mQ21tQ3dyMXhyOVRlTkRNZTc1WXp0Y3M0Qm5UR05I?=
 =?utf-8?B?UzRvZlUxVldjUG1aRXUzYldtbWxUUlZjVkc5Z2RuQnBLRFQ5UmRaZ21idElj?=
 =?utf-8?B?WFlFZ3FvN0xhMVNwVG5uTXlWd2VzNFdUcFpuMUJETDY3eDNhNm5MM01DUGFs?=
 =?utf-8?B?aHRiU1loclRJM1lkejBCQTRBdm1KVU0zRFFXUFg5U2hGcVBkOUxjNU5rY0pP?=
 =?utf-8?B?eEZURVZFaDZYZXk2RkgyVS81ckNKd0Vhc3RPT2ltQURtY2xWWURaSWxPYjFs?=
 =?utf-8?B?UWhGc0dRZDRtRUVlNUFNNDlWOTg1TEhZUVNYTFg4U3FNUWZHc3lMOU8xVDZs?=
 =?utf-8?B?UTUwNUZIbHhPWG9CQ0hnNWw1VGREQ1ltWnZFYk0zSGlGWmdsdU1UcytIaXFs?=
 =?utf-8?B?bjY3YnBPM05ta3g0QVdjOWdWZUpSSk5tUVYwS2YyWGt0TFg5c1QzbEZrSnFs?=
 =?utf-8?B?MHZGekhRalo1V2dhZWIwSG5PNjV4V1dvazNUaWZOWnBrVDd1YnA3dThzcnlq?=
 =?utf-8?B?TWpuR09acHI1Q2g1cFg5S1pNSlRlZG5OZ041bjRtZUJQKzlNYURmVFRQa0tk?=
 =?utf-8?B?NnFxRFZaNFNjcjFmV05CRHAva3NWVFpBZm1NRHpHd2REYmI5SzkvTVpDdmZR?=
 =?utf-8?B?YlpIZXdyY2FWWGZSdlFGajZ2QThvVzZ4QmlQWmNia2JLV210VVdCWUtlZFdz?=
 =?utf-8?B?Rk1mendGSzFpa1NwSzRMRDN5N2R3Y2tzODNWWEtpcTcvQ1VuSktob3p5T1Bi?=
 =?utf-8?B?T00rVzRGRW1nUmNUUm14bi91bmFqYksrMzZvb3FlRFRPUThTMU5INGExZWRQ?=
 =?utf-8?B?ZHdyemZwNndkb1h4QitVNk8waFpFeUdZYnFPWElxZUx1Z20ramlGMi9oZ3pB?=
 =?utf-8?B?Q3ArOXl4TEJBS2lTNG5iZ3lycThmaEFiVE03OEV5K0VoNGhRaTlRd3dBbXI1?=
 =?utf-8?B?NS93OVkwNGRWL1RUTVhQUy9leW9Zd0ZwZ3IvM1N3V0lJalFNWXRuS1pVOHNl?=
 =?utf-8?B?eFVRVFhNcVpzUk1XMExpTk16enlFdTFjdlhZekZoNXg1UUo2cWhYemJZdlQ5?=
 =?utf-8?B?ODZmcWdYdHAyYTJmakZWU3NqNFlmM2R2R2pPdm1ldVF4dWUycFJzc1BMdkty?=
 =?utf-8?B?djEzS0hLUnY0MjNRRG0zcWxJeUpmT2pzQVlFNUJvd0IvbU1iUEhDYnl3dG9h?=
 =?utf-8?B?Tlg1N1FQTDlKUEk5YTNYVURKZzVkTGd3ZXYybzRlUjFIallDdXR4VlE3NjBJ?=
 =?utf-8?B?T0xnSTl1aWd1YXNjdkRyclN1MndoanR6V1E0SE5PZzlZd1FPYW11Q2R1UytV?=
 =?utf-8?B?L1pZVlhHZEhqUGFyT3pqYXRZR3ZaZzRkU29CSzZieS9mQ2NTN21DQW1QS05U?=
 =?utf-8?B?b3pPTWovM0trSFRZUWE3cFYrRVBqeGN3VjhqdWRoWTYxRng3WVdNMU96NDZl?=
 =?utf-8?B?dThITDk0Unk0SlVpd1p5OXQybThoVzdkQUVMRzdrb3VseTdIZzgydGcxTE1D?=
 =?utf-8?B?OW1HZ0pXWHZudWxGeThBdnRjdDdTbG5UeE9pWGRPT3FwQ09USFg3dzliZUU5?=
 =?utf-8?B?c01wM0FyWGdOUHJIa3ZqU1EycWxkcEYvWU1yd3Ywd2RkNUdYVGs5OE9BMnYw?=
 =?utf-8?B?OXRpUjNkWDluNWgxVUxtZFNNYzNVQjRlS2I3ZHhkNzhldEVTRDZsMWl0cWVp?=
 =?utf-8?B?RERLZWhRQzhhWVpBNUFZR05hcnBmUjd1TXgvWXZUQ1YrVmNNMWhGZ2pyam1w?=
 =?utf-8?B?RUJ0MUUxaGFzNmppenhaVVo4OFI3M2ZlMUpSbzdjK2lQWEpXTGlYNU9rWE1J?=
 =?utf-8?B?WFV1ZnRCMEJRMVhSTm9CR2ZkMTdsNHd0ZWkydkhuN1ZudWtKWlNkaEQvWHg2?=
 =?utf-8?B?L0o5V2hsekU3RzhkMi9tRVRkelBOSVlFWjNBUG5tRkhEVHljWU91QlJTVS8x?=
 =?utf-8?B?R3JZdFliTjBCQkUvUjlyL2JUWGVicmVSNzZHNStIN0Y5MkZ3RWRoQTBiVXJ2?=
 =?utf-8?Q?12GDnVv0xUJJQ7Z1fX6+bJnva?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bdb050d-c6c4-42ce-99f0-08dbdc504f47
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 09:36:09.0827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJt6FS3WzK3OtimSsK/VFKHv8CCCxoG59BCTqw8q3bXwX+lUQBEZMVgb6PH/Xj4i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7352
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
Cc: "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "felix.kuehling@amd.com" <felix.kuehling@amd.com>, "Welty,
 Brian" <brian.welty@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------9yShrP0U1OuWevZjI27Q380R
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 03.11.23 um 05:04 schrieb Zeng, Oak:[SNIP]
> I also want to have a more advanced iterator at some point where we grab
> the BO lock for keeping a reference into the LRU list. Not sure how to
> do this if we don't have the BO here any more.
>
> Need to think about that further,
> Don't quite get the what you want to do with the advanced iterator. But with this work, the lru entity is a base class of ttm_resource or any other resource struct in hmm/svm. Lru is decoupled from bo concept - this is why this lru can be shared with svm code which is bo-less.

This is just a crazy idea I had because TTM tends to perform bad on 
certain tasks.

When we start to evict something we use a callback which indicates if an 
eviction is valuable or not. So it can happen that we have to skip quite 
a bunch of BOs on the LRU until we found one which is worth evicting.

Not it can be that the first eviction doesn't make enough room to 
fulfill the allocation requirement, in this case we currently start over 
at the beginning searching for some BO to evict.

I want to avoid this by being able to have cursors into the LRU, e.g. 
the next BO which can't move until we have evicted the current one.

BTW: How do you handle eviction here? I mean we can't call the evict 
callback with the spinlock held easily?

Christian.

>
> Oak
>
--------------9yShrP0U1OuWevZjI27Q380R
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 03.11.23 um 05:04 schrieb Zeng, Oak:[SNIP]<span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:SA1PR11MB69911CED830F657F608BC52392A5A@SA1PR11MB6991.namprd11.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">
I also want to have a more advanced iterator at some point where we grab
the BO lock for keeping a reference into the LRU list. Not sure how to
do this if we don't have the BO here any more.

Need to think about that further,
</pre>
      <pre class="moz-quote-pre" wrap="">
Don't quite get the what you want to do with the advanced iterator. But with this work, the lru entity is a base class of ttm_resource or any other resource struct in hmm/svm. Lru is decoupled from bo concept - this is why this lru can be shared with svm code which is bo-less.</pre>
    </blockquote>
    <br>
    This is just a crazy idea I had because TTM tends to perform bad on
    certain tasks.<br>
    <br>
    When we start to evict something we use a callback which indicates
    if an eviction is valuable or not. So it can happen that we have to
    skip quite a bunch of BOs on the LRU until we found one which is
    worth evicting.<br>
    <br>
    Not it can be that the first eviction doesn't make enough room to
    fulfill the allocation requirement, in this case we currently start
    over at the beginning searching for some BO to evict.<br>
    <br>
    I want to avoid this by being able to have cursors into the LRU,
    e.g. the next BO which can't move until we have evicted the current
    one.<br>
    <br>
    BTW: How do you handle eviction here? I mean we can't call the evict
    callback with the spinlock held easily?<br>
    <br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:SA1PR11MB69911CED830F657F608BC52392A5A@SA1PR11MB6991.namprd11.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">

Oak 

</pre>
    </blockquote>
  </body>
</html>

--------------9yShrP0U1OuWevZjI27Q380R--
