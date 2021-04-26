Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D5F36B97F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 20:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4596E85A;
	Mon, 26 Apr 2021 18:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE5C6E210;
 Mon, 26 Apr 2021 18:56:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNidi4iNDbusE3CYkEZ9RM5288PfBqXLJuCETAyc8TBo2mQ34LRyBJq+pVFUOa1GrWhawb4NJ3+RpLty+b+ZV6mrWzTNQj6DEYiCc7JHhaOk+/xbFHJfNm58JmGMw8RrEnJjMPG5qbYH8y74bwQkLV1yEqNWaeFMrSIJKbIs+L3aj4X7zoFsJBqLMTfHSWe+xwZhJB7X1hq1y4Jh7ub/fiG/0WSUNDS6BQSEDjnHnTiENKsRty0JtIvHCdJYUMrJyF9NzMwSW7WuN+aCGLBcX25jWiJ92vc8J+Jt3EOPN8UwK+W8QM1AkvlaEz8C7OyUPyd6O0Qe5W1BmxOM9+PsUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbhtpkX1LvDRAMXiuA5FiosXGOrbM03UYotipz9bIQo=;
 b=EANNW9H+AuJUFQ9DzPn2E+azrbl9fQaQJ61PZtTRHBnw31Gre3ZrEO6q964fRgmsSFODHw3izqB2I8Mau6EBR61D0V8rks7SbDJ5BfbVXdQLAlgHKVDhdT5hLAZfWv8u2zebv3gltUajWtTb5hR9KACk7tBFRgnFN3A55e/Okr67Twir7WLJYSsD6eJZt8hpzpRgjW5zQ7Q67NpHplAiLb1+x9J3z/xPrk9qWDS+7p/alWpd7Vye2ZsA6U09+Qne/pVjzfVfMfnty84RF7ECkI7uUYxgXHDLkCXHrdjww2p2lDGkPHCwraGIBz9j4APTUOH92+6vJf9wqu54cFOhAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbhtpkX1LvDRAMXiuA5FiosXGOrbM03UYotipz9bIQo=;
 b=o/ky0s2tqUSBXaYzrwYCfj5XZzQvV7Qv5eYd8Sv5OP+rwEjTXx6qR/Iji3NxQvQrdN+05SuffPrTe8HkVeZgTstTsHSiRpFbCM9F+9VmwO5erDhVM5slQh902Ca4RdhYXdgF6TAX4hivx4ZJB53dIduWiW7BqANi/Su6DmJx5Vk=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW3PR12MB4378.namprd12.prod.outlook.com (2603:10b6:303:52::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.27; Mon, 26 Apr
 2021 18:56:33 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::c476:9fdf:664e:4f25]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::c476:9fdf:664e:4f25%5]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 18:56:33 +0000
Subject: Re: [RFC PATCH 1/3] drm/color: Add RGB Color encodings
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20210426173852.484368-1-harry.wentland@amd.com>
 <20210426173852.484368-2-harry.wentland@amd.com> <YIcBUl+94sHJsT8B@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <0090ce07-6102-59e7-bc8c-3528297aa5ae@amd.com>
Date: Mon, 26 Apr 2021 14:56:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <YIcBUl+94sHJsT8B@intel.com>
Content-Language: en-US
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN9PR03CA0970.namprd03.prod.outlook.com
 (2603:10b6:408:109::15) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.7.162] (165.204.84.11) by
 BN9PR03CA0970.namprd03.prod.outlook.com (2603:10b6:408:109::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22 via Frontend
 Transport; Mon, 26 Apr 2021 18:56:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00cdd4ac-46e6-481c-fe87-08d908e50226
X-MS-TrafficTypeDiagnostic: MW3PR12MB4378:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW3PR12MB4378C364DEE0B873673666B28C429@MW3PR12MB4378.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j1WqXpVZdvnEIlltMiP7VTzBJZvoiS1aoKvvqG+L/Y+pcKMpT6tj78FY2rKVHVaPYj2vd42oLrqF64u6+SW1QjMPPAW6/ZesRGXBb2IUxTaPdLm6FpWMnSrlq3H8mkvZF8G3ezG4IwIqtvYMt5mC+FcKxokYIEuIJ7p6sKr3SOHN96HLlD/7zeeM1KxoB//2rKIkgxq64l89Yyl6RzV6AP58zOWjPEH/Jco8PGdBtX5NycNGRcUXGKPHJ8ZGu5QRFGLl3ehHQxriP/sjYnt343sV58QTRLJ9gYv3LIagI1abFq6yjCptIvmGt5IRHclp3rncT9BrepmaMIoSoDfJH8zHVIt1F+vVIKSGix8kg1qNlKApWr3S3ky02p3/J2/x22Tir/c4Pl7skrvRIiRV0HMz+qCgFbzOpbpZtU04wyt23BT6xAACspEYJZOyTj2yxgDhZYQ0xys3XCH9ip3Bk9HSF72VGFk+YIsiW/OFntbipCv87iAIJpGFpQfOfL8cviltsSpvysRV+Y8XxNR9qSePSWAnXF0eTStltmofvl/2xn3+rJNjppi2bzbDf8eRPukCyLVfTBjrnKsa6aDJYpxSHVfYJb9i2UtUqKuUvsaHrBNij46p1o9wvZZJqD+ESZnaA10fpSCGS+VxiQi2b3e1oAH+161O1glTJ7bqFBqXD5YsJaVMesmXSP9QhScpaYG7DgzHDsqT/L+DcZZ3T2nTa5sqGmDPaYh/vA+1I84=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(376002)(346002)(366004)(136003)(6916009)(6486002)(956004)(36756003)(31696002)(4326008)(86362001)(2616005)(44832011)(16576012)(66556008)(66476007)(478600001)(31686004)(66946007)(966005)(316002)(8936002)(6666004)(38100700002)(5660300002)(186003)(2906002)(66574015)(26005)(16526019)(8676002)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dHJBbFRnclFKa2l3L01iN3B5R25kVitzbVJDOHBYcDcrTXNRWU5ya3dCTUJo?=
 =?utf-8?B?RDVBaWV4OG9HaVAxNzV3RTN0WDVlSVVhdFV5Mkd4K1QvZkJXOFd2UGYxaUZE?=
 =?utf-8?B?ZGJwUGpRZ29KYU5JWFM3OEp5elpIUEsxSzlBdEl3RGhMRWlkOFFTTll5S01a?=
 =?utf-8?B?ZXE3R1NnYUdlRC9MbzgyMnBvNXRRVEE1NU9lR1lHWC80UG1lbnRRc0luRFE3?=
 =?utf-8?B?VFEyc045RWZsY01qTlhHaWRXT3RnL3ljWjhCQ3lscWhCNi8yNkJyditMY0or?=
 =?utf-8?B?SnZJQWhsWk1TSkE5UFRKRWZxcXhTbDZEMGZNaStPbFgyVTdSL3hXMzI2RGxV?=
 =?utf-8?B?Z2xaUVhCVFg4QjhWMHZFbnZ0S3FCSUxQNjJIVThENGtUb0ZTT3J1cE96VEFF?=
 =?utf-8?B?YVoxb3BDejBGT0RmMWdlSFN6SHM5YXc5WDU4MGVEMER1cm5qTnZ1OG9oaEp2?=
 =?utf-8?B?dU95Rzg4TFpRN1N6dC9NWkJ2NUI2OGhDQjZmVE8zeUtpZmNCV1VVTXBDTWM2?=
 =?utf-8?B?TGZHTHdtQllHVklyaXpTdVNYVDZIQ3RkUTVoeWdyOEM5bDdWUmNtMVJ3VUh0?=
 =?utf-8?B?emo1WGI2ZjRCQnhPSG1CU2R6UjFvM3gvV3hJZHJuSElwTHAzb1g2ZkJtcjZK?=
 =?utf-8?B?c3RQdlcrMjNoYW5HNFJpamlQZjlHYW94OUNIUHhwK0ZLeDY1SE9IVFBNT0dr?=
 =?utf-8?B?d0E2czcxM1U3dHVqelk5R0IvclJzcWJjVWN6dVBDQ05iUGQ0ZSs1U3N5RjNi?=
 =?utf-8?B?VUxCajA2bW1VNEhWUmJGZG1TYzhvMlJiV3VNZlFsamVYbi9uTG9pVG5NSzhw?=
 =?utf-8?B?eU1DcTRTbXV3Qm1CMlI3OWxLOFBBQk9rNnJDUlBXcXZnMXgwaThUUzczWXdU?=
 =?utf-8?B?L3ZPSCt1QkNUNmpTTDZXN1VZRURMKzQ1UHRvNDRSbVBOUzlrODVUdXhxNlhE?=
 =?utf-8?B?SFFVV0ZRWTU3LytXUTNoZTk0NUpTNHNBYTJTaEtjUFVxdDJWNU4rN2dSRDE2?=
 =?utf-8?B?M0Q3Sk05ZFRTKzdnWXlubEFiMkE0VVVNelk2TUdGK1FqZWhOYUluTnRTSnV3?=
 =?utf-8?B?Q0tsdGs4OXA3alhyZENxc29tbE5uZG0xbmJEbllPMG9DQzhYeGVKQkhaQVNu?=
 =?utf-8?B?aGsxZHJnZVczT01pK00wMVdTa2JlZDdKdXlYNmtpa0RnL25FTStOM2JhYmJ4?=
 =?utf-8?B?b2hpOWkya2RUT2U2dkNUMDBocnN3NDJmL3NNeDNrMFJFcnd6T0g4TDlCOHcx?=
 =?utf-8?B?Q1d0Wjl5UU03c0dvdjFTUVA5a0Urc0t0THMxOXowK2R2Qzk0OGd4dUI5SlMr?=
 =?utf-8?B?UjBTbzFwa2o4VUNwc3U4U2M4aVVWampaS0s5eUlHcGh5SGRHMU9XQzlaeWlr?=
 =?utf-8?B?ZllyeGZRVVRDUC9vczVyalRzbFhxN25ISEZXZjVwWjBkZnZtSkdFbWZsTVBi?=
 =?utf-8?B?WEVtbGRXNFNkWThxeWM0ZjJFS0pXUVRXQ3ZjajRVekRiaHVNMGp1YmU4UFRL?=
 =?utf-8?B?TGx1cVRpU0oxb0xYQzBwWm0zLzZIRkc0S2JVZEI2ZHV5Q01QTmFPMDA1ZGky?=
 =?utf-8?B?ZWIwOHRHa3U3WmtVVjQyYkxmL2FxZ2VSWk9uQUMyQU9Vazh6eUlKY1kyOTdX?=
 =?utf-8?B?Ni8vUzJjcFJmRkdZNmdwODc3bTJUQzRJKzhmNWYvdWFQMW5scXpCdUZIOHZC?=
 =?utf-8?B?QjZCRFBpZXNxRW1mZXZ0dE40U3EySzVkQ1JvWlRYZUpKWU02RitHK0pLNkIz?=
 =?utf-8?Q?WJkLPrqGecJGPI2vTRJ4GVTVBaMm5wpkG1Bn3XK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00cdd4ac-46e6-481c-fe87-08d908e50226
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 18:56:32.9036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGJlk+MIHKgBfrhsqLsbDCpEUffivI8g7mL1HITs2m/H7/AD3qkoHgQxe3jXl/AyVO/l235o4Wvs6CY7oxv0ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4378
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, mcasas@google.com,
 Shashank.Sharma@amd.com, dri-devel@lists.freedesktop.org, Shirish.S@amd.com,
 sebastian@sebastianwick.net, Uma Shankar <uma.shankar@intel.com>,
 hersenxs.wu@amd.com, amd-gfx@lists.freedesktop.org,
 laurentiu.palcu@oss.nxp.com, Bhawanpreet.Lakha@amd.com,
 Nicholas.Kazlauskas@amd.com, Vitaly.Prosyak@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMS0wNC0yNiAyOjA3IHAubS4sIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiBPbiBNb24s
IEFwciAyNiwgMjAyMSBhdCAwMTozODo1MFBNIC0wNDAwLCBIYXJyeSBXZW50bGFuZCB3cm90ZToK
Pj4gRnJvbTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Cj4+
Cj4+IEFkZCB0aGUgZm9sbG93aW5nIGNvbG9yIGVuY29kaW5ncwo+PiAtIFJHQiB2ZXJzaW9ucyBm
b3IgQlQ2MDEsIEJUNzA5LCBCVDIwMjAKPj4gLSBEQ0ktUDM6IFVzZWQgZm9yIGRpZ2l0YWwgbW92
aWVzCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5M
YWtoYUBhbWQuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2Vu
dGxhbmRAYW1kLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210
LmMgfCA0ICsrKysKPj4gICBpbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5oICAgICB8IDQgKysr
Kwo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9yX21nbXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Y29sb3JfbWdtdC5jCj4+IGluZGV4IGJiMTRmNDg4YzhmNi4uYTE4M2ViYWUyOTQxIDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9yX21nbXQuYwo+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2NvbG9yX21nbXQuYwo+PiBAQCAtNDY5LDYgKzQ2OSwxMCBAQCBzdGF0aWMg
Y29uc3QgY2hhciAqIGNvbnN0IGNvbG9yX2VuY29kaW5nX25hbWVbXSA9IHsKPj4gICAJW0RSTV9D
T0xPUl9ZQ0JDUl9CVDYwMV0gPSAiSVRVLVIgQlQuNjAxIFlDYkNyIiwKPj4gICAJW0RSTV9DT0xP
Ul9ZQ0JDUl9CVDcwOV0gPSAiSVRVLVIgQlQuNzA5IFlDYkNyIiwKPj4gICAJW0RSTV9DT0xPUl9Z
Q0JDUl9CVDIwMjBdID0gIklUVS1SIEJULjIwMjAgWUNiQ3IiLAo+PiArCVtEUk1fQ09MT1JfUkdC
X0JUNjAxXSA9ICJJVFUtUiBCVC42MDEgUkdCIiwKPj4gKwlbRFJNX0NPTE9SX1JHQl9CVDcwOV0g
PSAiSVRVLVIgQlQuNzA5IFJHQiIsCj4+ICsJW0RSTV9DT0xPUl9SR0JfQlQyMDIwXSA9ICJJVFUt
UiBCVC4yMDIwIFJHQiIsCj4+ICsJW0RSTV9DT0xPUl9QM10gPSAiRENJLVAzIiwKPiAKPiBUaGVz
ZSBhcmUgYSB0b3RhbGx5IGRpZmZlcmVudCB0aGluZyB0aGFuIHRoZSBZQ2JDciBzdHVmZi4KPiBU
aGUgWUNiQ3Igc3R1ZmYganVzdCBzcGVjaWZpZXMgdGhlIFlDYkNyPC0+UkdCIGNvbnZlcmlzb24g
bWF0cml4LAo+IHdoZXJlYXMgdGhlc2UgYXJlIEkgZ3Vlc3Mgc3VwcG9zZWQgdG8gc3BlY2lmeSB0
aGUgcHJpbWFyaWVzL3doaXRlcG9pbnQ/Cj4gQnV0IHdpdGhvdXQgc3BlY2lmeWluZyB3aGF0IHdl
J3JlIGNvbnZlcnRpbmcgKnRvKiB0aGVzZSBtZWFuIGFic29sdXRlbHkKPiBub3RoaW5nLiBJZS4g
SSBkb24ndCB0aGluayB0aGV5IGJlbG9uZyBpbiB0aGlzIHByb3BlcnR5Lgo+IAoKSWYgdGhpcyBp
cyB0aGUgaW50ZW50aW9uIEkgZG9uJ3Qgc2VlIGl0IGRvY3VtZW50ZWQuCgpJIG1pZ2h0IGhhdmUg
b3Zlcmxvb2tlZCBzb21ldGhpbmcgYnV0IGRvIHdlIGhhdmUgYSB3YXkgdG8gZXhwbGljaXRseSAK
c3BlY2lmeSB0b2RheSB3aGF0ICp0byogZm9ybWF0IHRoZSBZQ2JDciBjb2xvciBlbmNvZGluZ3Mg
Y29udmVydCBpbnRvPyAKV291bGQgdGhhdCBiZSBhIGNvbWJpbmF0aW9uIG9mIHRoZSBvdXRwdXQg
Y29sb3IgZW5jb2Rpbmcgc3BlY2lmaWVkIHZpYSAKY29sb3JzcGFjZV9wcm9wZXJ0eSBhbmQgdGhl
IGNvbG9yIHNwYWNlIGVuY29kZWQgaW4gdGhlIHByaW1hcmllcyBhbmQgCndoaXRlcG9pbnQgb2Yg
dGhlIGhkcl9vdXRwdXRfbWV0YWRhdGE/CgpGdW5kYW1lbnRhbGx5IEkgZG9uJ3Qgc2VlIGhvdyB0
aGUgdXNlIG9mIHRoaXMgcHJvcGVydHkgZGlmZmVycywgd2hldGhlciAKeW91IHRyYW5zbGF0ZSBm
cm9tIFlDYkNyIG9yIGZyb20gUkdCLiBJbiBlaXRoZXIgY2FzZSB5b3UncmUgY29udmVydGluZyAK
ZnJvbSB0aGUgZGVmaW5lZCBpbnB1dCBjb2xvciBzcGFjZSBhbmQgcGl4ZWwgZm9ybWF0IHRvIGFu
IG91dHB1dCBjb2xvciAKc3BhY2UgYW5kIHBpeGVsIGZvcm1hdC4KCj4gVGhlIHByZXZpb3VzIHBy
b3Bvc2FscyBhcm91bmQgdGhpcyB0b3BpYyBoYXZlIHN1Z2dlc3RlZCBhIG5ldwo+IHByb3BlcnR5
IHRvIHNwZWNpZnkgYSBjb252ZXJzaW9uIG1hdHJpeCBlaXRoZXIgZXhwbGljaXRseSwgb3IKPiB2
aWEgYSBzZXBhcmF0ZSBlbnVtICh3aGljaCB3b3VsZCBzcGVjaWZ5IGJvdGggdGhlIHNyYyBhbmQg
ZHN0Cj4gY29sb3JzcGFjZXMpLiBJJ3ZlIGFsd2F5cyBhcmd1ZWQgdGhlIGVudW0gYXBwcm9hY2gg
aXMgbmVlZGVkCj4gYW55d2F5IHNpbmNlIG5vdCBhbGwgaGFyZHdhcmUgaGFzIGEgcHJvZ3JhbW1h
YmxlIG1hdHJpeCBmb3IKPiB0aGlzLiBCdXQgYSBmdWxseSBwcm9ncmFtbWFibGUgbWF0cml4IGNv
dWxkIGJlIG5pY2UgZm9yIHRvbmUKPiBtYXBwaW5nIHB1cnBvc2VzL2V0Yywgc28gd2UgbWF5IHdh
bnQgdG8gbWFrZSBzdXJlIGJvdGggYXJlCj4gcG9zc2libGUuCj4gCj4gQXMgZm9yIHRoZSB0cmFu
c2ZlciBmdW5jLCB0aGUgcHJvcG9zYWxzIHNvIGZhciBoYXZlIG1vc3RseSBqdXN0Cj4gYmVlbiB0
byBleHBvc2UgYSBwcm9ncmFtbWFibGUgZGVnYW1tYS9nYW1tYSBMVVRzIGZvciBlYWNoIHBsYW5l
Lgo+IEJ1dCBjb25zaWRlcmluZyBob3cgcG9vciB0aGUgY3VycmVudCBnYW1tYSB1YXBpIGlzIHdl
J3ZlIHRocm93bgo+IGFyb3VuZCBzb21lIGlkZWFzIGhvdyB0byBhbGxvdyB0aGUga2VybmVsIHRv
IHByb3Blcmx5IGV4cG9zZSB0aGUKPiBodyBjYXBhYmlsaXRpZXMuIFRoaXMgaXMgb25lIG9mIHRo
b3NlIGlkZWFzOgo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1k
ZXZlbC8yMDE5LUFwcmlsLzIxMjg4Ni5odG1sPj4gSSB0aGluayB0aGF0IGJhc2ljIGlkZWEgY291
bGQgYmUgYWxzbyBiZSBleHRlbmRlZCB0byBhbGxvdyBmaXhlZAo+IGN1cnZlcyBpbiBjYXNlIHRo
ZSBodyBkb2Vzbid0IGhhdmUgYSBmdWxseSBwcm9ncmFtbWFibGUgTFVULiBCdXQKPiBkdW5ubyBp
ZiB0aGF0J3MgcmVsZXZhbnQgZm9yIHlvdXIgaHcuCj4gCgpUaGUgcHJvYmxlbSB3aXRoIGV4cG9z
aW5nIGdhbW1hLCB3aGV0aGVyIHBlci1wbGFuZSBvciBwZXItY3J0YywgaXMgdGhhdCAKaXQgaXMg
aGFyZCB0byBkZWZpbmUgYW4gQVBJIHRoYXQgd29ya3MgZm9yIGFsbCB0aGUgSFcgb3V0IHRoZXJl
LiBUaGUgCmNhcGFiaWxpdGllcyBmb3IgZGlmZmVyZW50IEhXIGRpZmZlciBhIGxvdCwgbm90IGp1
c3QgYmV0d2VlbiB2ZW5kb3JzIGJ1dCAKYWxzbyBiZXR3ZWVuIGdlbmVyYXRpb25zIG9mIGEgdmVu
ZG9yJ3MgSFcuCgpBbm90aGVyIHJlYXNvbiBJJ20gcHJvcG9zaW5nIHRvIGRlZmluZSB0aGUgY29s
b3Igc3BhY2UgKGFuZCBnYW1tYSkgb2YgYSAKcGxhbmUgaXMgdG8gbWFrZSB0aGlzIGV4cGxpY2l0
LiBVcCB1bnRpbCB0aGUgY29sb3Igc3BhY2UgYW5kIGdhbW1hIG9mIGEgCnBsYW5lIG9yIGZyYW1l
YnVmZmVyIGFyZSBub3Qgd2VsbCBkZWZpbmVkLCB3aGljaCBsZWFkcyB0byBkcml2ZXJzIAphc3N1
bWluZyB0aGUgY29sb3Igc3BhY2UgYW5kIGdhbW1hIG9mIGEgYnVmZmVyIChmb3IgYmxlbmRpbmcg
YW5kIG90aGVyIApwdXJwb3NlcykgYW5kIG1pZ2h0IGxlYWQgdG8gc3ViLW9wdGltYWwgb3V0Y29t
ZXMuCgpIYXJyeQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
