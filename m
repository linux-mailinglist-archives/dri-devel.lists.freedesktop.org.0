Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0F038CD11
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 20:17:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94286E83C;
	Fri, 21 May 2021 18:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4828D6E83C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 18:17:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtxz81dIm6psqfQ0UsDUsF2L+W9fZ9Dqi0WJm70E9ore1CwdSBBAOBQ8vsIb0+p6ZPDj/GQfPZ+L6KlvzPsCGES7bY1X7ejgLExeDLjriTm8tSFzsvboV+BX8SqGHhBkJYGwc2m3mXqKQOAslHfK+MV3cOM8ocRha7F6E5cOyAPWq1eEo9fv8MKAF/GU2RIWbeNe7XsEhfwAQTGsKDKSknk/KHXUsa1Yg3MBWWpRpvkuzPhPIjRuOhEL4jYdnVwVav9PbaeOtwMR6RGW4QEH+j34yM5EF4qt5NDEk1hbGNG3y5IHj4721uH4XORGRpRYcWcXW+OQuJq9FAb+XP9WlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mA0+8Yl4M0R55MF8oOzsucSrK2ze6uW/s6ieXSAbDZw=;
 b=WAQ3NECYB0ZKVar6dOOrMqkuEJG4ItJ2FvpD72WvIsl8UgDlhj1mV7dluysmLSyDsXL/CQeHm8x4LnDgsGloVgp0DFaYYgrchP42I3Pqb5N1wB+CPT9JeB+z5Il6l7jpoKec4UPVeE/dfVZFkx9FDLjCMr0IBG7AmgOP811kGsbmQYGjWdXXp6c6RWgfSclI+/V3d5d02K8eERRnXkQpTvCgZxPpdmZZ3qBRcxk2uL8RfMLZstqTA174NGSI2HR16j9y6sH90yI8dasyPJ2xtYscJkBqANAS6etplzGROjANM92JlGklFUNHzV3YVZv8EGleA6Cpz8lsxUXUyg2efw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mA0+8Yl4M0R55MF8oOzsucSrK2ze6uW/s6ieXSAbDZw=;
 b=ymberibYyntN7AxB/WSJofXPOgyqM9ynuscxVX88GzdF8EGAQYi8Hv1wO2xP3KELAmhC/YbrCtCpJdJoUVWXzLdIH0Q/47Oc79gj33+LJewDvAwpGLDyxbAaToWS3eRK0mdw4kr4yFGKXc7hO79vsdUYiKQ4o0l+cGM3U7SvSvQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=vmware.com;
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6926.namprd05.prod.outlook.com (2603:10b6:208:18e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.12; Fri, 21 May
 2021 18:17:30 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02%7]) with mapi id 15.20.4150.019; Fri, 21 May 2021
 18:17:30 +0000
To: christian.koenig@amd.com, dri-devel <dri-devel@lists.freedesktop.org>
From: Zack Rusin <zackr@vmware.com>
Subject: ttm_resource_manager::use_tt
Message-ID: <3ed92523-df06-87cd-f926-e632b780f69b@vmware.com>
Date: Fri, 21 May 2021 14:17:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [108.36.85.85]
X-ClientProxiedBy: MN2PR15CA0027.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::40) To MN2PR05MB6624.namprd05.prod.outlook.com
 (2603:10b6:208:d8::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.193] (108.36.85.85) by
 MN2PR15CA0027.namprd15.prod.outlook.com (2603:10b6:208:1b4::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.24 via Frontend
 Transport; Fri, 21 May 2021 18:17:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37971472-a85b-4c55-32db-08d91c84b261
X-MS-TrafficTypeDiagnostic: MN2PR05MB6926:
X-Microsoft-Antispam-PRVS: <MN2PR05MB69268D07871C7948B0A07869CE299@MN2PR05MB6926.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vs5+wXmltaUnAvq+CwOc3gj3TY0jO9IntiUjFyLVRED09POGAe9g/8OMQ7CDzm4UulExh2IF/BzJzV0LU54dFIUPXDEhBOqD6pFGwMjhCQxfNGIvqi1jcFhPAsRqvlPSyrKPUz5l1Nur74cyhgi/A1w8EmY4HjdRgQ7uE9B3u/nhZe0LM8p3egsiNHA3cgWrGvFuAj5AP3DoJOvHHm+n9Jdjd2jFdbZ08F+4h7spL85y0oT1ZurS/hOomqBiqvAlIrN3laQjSf3OK+L7pigsGvFMjU2p5qE8DwXVul82yTrAnnyhYeGssKivMNe/obgmbCy6xP80WvnObmUdUb8CqfbMLzi+09T9eByeSgZm3YtJLQJwMHVj7NGLJf3okUw1a/uncUl8txqNjXf3n6MKmuIqBEd8fAboS2ndO06g+Q73WV3pkMTXiHosAkMNJtS/iGV+hv/3cxXT96pGQdlHiOOQNGTwTQv92NLZyxE/2WpzNAFWe0qWxHb+mBmLfFUqJFi2SgXQ9z7uL+y9RRyJIuvLwGAX2yh7zkT5RwamXUynmPUGnwvtIfKZAuM35QmOHATSLFZgRFqdRo+G0SMDiInFnJIOPaQnQi8hRNCrhXLE6Nk5vcgYs5gelaJpn5x0Jt//kNq3/Zz6NPtBSBhip/aFGANdc5njKVJrzbPyAbsbaUxkgOTNu+5MDd1cco12VqK1vzToDd6emrPxAGQd+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(956004)(478600001)(2616005)(966005)(6916009)(31686004)(8676002)(16526019)(8936002)(186003)(86362001)(5660300002)(316002)(66556008)(66946007)(2906002)(6486002)(26005)(4744005)(31696002)(16576012)(36756003)(66476007)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UlFFTGZhUS9Lby91aStMa1AyOGFYZHZ5NG9zTVJFeDBEZGw2Rk16M0plU05i?=
 =?utf-8?B?cVRVTnd2VUF6WVFuMmoyMTl0OVRTVW0ySjNhSkRreCs1ZEdzbEZtdDV5bGEv?=
 =?utf-8?B?ZnYxS1dGOUR6dThVNVArUjBKalRjNUxLblF0WVRsVklYOWtDdTFvVm0rRXVa?=
 =?utf-8?B?TmRvSUlHd0FYakd3M0gwRGVIL0VUNXNmL1IzSVVOeXZBL2NoM1kxTDVGVlA1?=
 =?utf-8?B?MG5UVFpxVVdXSTZZRlQvZ2JNYVBKc01aMGR2T2MxMGhmTnRieUdqTHZ3aGZI?=
 =?utf-8?B?dTcrV2o0STVWSXBGTDdkTjhHQ0Z5NE1XRzRIdFNaOVNFZHhOTkZ2cExZY3R3?=
 =?utf-8?B?V3dScGRKRGZkTUZBMnJGMHFvN3Y4SzJqVjgvODZnZmxob21BZXcrZTgzUlNF?=
 =?utf-8?B?SU1nOXNacStWblNFa1VTcUQ4RnJiQ2JMOXdxdDcyL2IzMnBqNHoybkVSbFkz?=
 =?utf-8?B?U2llbVdLTDlLdjFnS1M3eWNQUEJlNnBjMVJKTDBMM3RCTlRjeUk1MmtHcVk4?=
 =?utf-8?B?V0hMSkdibDF0NnBNTUd1bHIrM0RpL21pQ1JNaVlUVGtRMkxVNER5L2dRQnNY?=
 =?utf-8?B?eTFGNmROWlRrRERLN293dzJKRHFmb2FYQ2NxOWxoOEZrRkIrbHFQWUZjS21Y?=
 =?utf-8?B?azluQXE3MGpuQWp5V051SjJUdmozaVREN21LL0dCS2tpTVVubUt6ZmJFTDlE?=
 =?utf-8?B?d0Y0NnBGQjlUVndjdThDNEJndUNIMUdaNG1QNTcvQlVrTDc2VHprL3FvRk91?=
 =?utf-8?B?cmZMMW5kL0IrL0hadnB2bndKRTNRTDlsdnhXWEc0OG8xMEFMNnBxS1k2cUF6?=
 =?utf-8?B?VGU0SmVXWXo5L0gyZGtvN1V6SEtYdFgxbFVnM2trem5kT1g3R21pZ01kSjdE?=
 =?utf-8?B?RXJOdW5ZODRkRFBwNkNMOFM1UkVNWXVrbSt1ZzJ2S2tmTzVGN3EyWDJONnpU?=
 =?utf-8?B?ZzNlOEJaeTNNcEo3QkhscUlKTzNkZGJ0aHZvQjJzV2NBU0phaDIzL2grSkpS?=
 =?utf-8?B?RVdRMSt4WkxPckJIaHBWSVhtYkZkU1h2UHFkWmdYdndYbkJQWkxQNFpTVUx0?=
 =?utf-8?B?aC9HV0pTMlZxbnViWVJHN24xQmtVTFdIczBzSnBJeGo5N3NxYXVKSHZMY0xU?=
 =?utf-8?B?dU1OL1RxUHl5M1UzVzI4c2Q1dnN4QVMvT2ExUUNHK1JnVXkzL2tobm9iVnB5?=
 =?utf-8?B?d3laSEhWeW5zUk5TdFVYdGNnTHB3bGZncmhjYTRzOTIvUHRTNzZ2eXVXcUYr?=
 =?utf-8?B?RVI1SVJQaGVLNUpEOUlremVkNmpFMGxoaXRpOEtBbDhaVTg4RkdQYnZjdWpm?=
 =?utf-8?B?ZG9WVStKNmJWd1NtazdxZDhwdlNYSldkZ3NYdWMvaU14M0U5YVBPUUZkSnls?=
 =?utf-8?B?NzV3S2lNNEYyUTlwOEhORWVLdUhtTmdENEhzNE80L1pycEdSM0Z1UXl5eFh6?=
 =?utf-8?B?M1Y0czhMVFBqYy81TG1kWnpFK2pPV3p3YmN3WUhxdTNVQVlzV3pRVmtXNDhF?=
 =?utf-8?B?d21UbkVBdDlrUC8zVWxNVncxcjdyUWRKNWN4bHlVVDBra2RpTkJYNlJFaTNy?=
 =?utf-8?B?cHMrL0NITW5PUG1NVVE2TnZoUHIyL09uNG5mWHZMMm93eVBwbVE2b2NiYktM?=
 =?utf-8?B?ejh1VlM5RU1pNWE2WWV4eDk2OGI5a1ZuOEloY2RkeE9sZTMwcTlkc1gxaERm?=
 =?utf-8?B?dFE5VENick1Xbk1UbmgvdGg5WnQ2ZmJ0RlphQ3YvL1loV0VFOUJqODhZd1JD?=
 =?utf-8?Q?Th4nRghwE5Kam2OH/+nZTMqfN7RWe+8os+IS5ss?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37971472-a85b-4c55-32db-08d91c84b261
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 18:17:30.5200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Q2HS91buVuEeo8iuwOV+9zXUwdnwRIpvZPX02kwKQG4a/57aMMqXzAPoqLXSLRKLKK58pK7ovqrq0i7j+sgKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6926
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

Hi, Christian.

I was just going over some old patches and I was just looking at your series introducing use_tt:
https://patchwork.freedesktop.org/series/80078/ and the change https://patchwork.freedesktop.org/patch/382079/?series=80078&rev=1

Do you happen to remember what was the worry behind the /* TODO: This is most likely not correct */ in vmwgfx_ttm_buffer.c? I'm trying to figure out if we need to address it.

z
