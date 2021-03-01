Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4F832835E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 17:18:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2906E83D;
	Mon,  1 Mar 2021 16:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770070.outbound.protection.outlook.com [40.107.77.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B8E894D7
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 16:18:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8cQpxgJS0ZinXwkpO/DWPJohdKnuOkWQFHtxq0sm0yIvD5SmZylozSVl/CMED19/895zDNxfqYF7QZI69wZXx2RihXhLqRyB2Jv89d6/1vpMOGu1J2NjKIiQyseSRkgJ3hAfEGzTwPRGY5W+bMyGwNRWN8kt9vaujSzHd6YuRWPg3031RHYEsP0DiQKRoprGtriKkTY8eP6OUWubZprX0MA9BJO5exx888P/LzO7RT+H9LujZJRFp+X/MgXJGIViZv3aCT0vXbjoUBy6tmNpnBqAkXsiCIVyMKeQrbp6yDenpc542JJYXgsqI9E5GtaY3QFNAxpE8jpnaLdbBDTIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iF55qSoxQOGEbayxURNGwezG4c4OAtOW6PCmn2k3o3M=;
 b=K2B6QI1RNT2hHBWsmGGBLp1mUZCkUPSuLNprBjIxCQeIGnFLiKEcrO1VmglBbUIWmEDzJwT0aNq5v6UcPL7rwOZoJowLb2GUNFTqEpNQBIqmgVx8nhgnG4ZHypdw0QxTj1YH/f/Dwflqyu2JFGE4epFeswODmxZSS7WioFpraSxF7PyP4bCAJMIbyLQbbZP7wvxUQ/uNAQ8wFsXU4dkrada0Bc5zq5356Hhu4VIM7rhSN65Xb9UysBMbrCsojb0ZI4L9hSwjr6iRIvbxmDAJqWq134W+RLbPxJEz1EBVmzkS92EGDbuON5YKHKFJ3ggPNTZyA+mYdmehBS7lOmFJ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iF55qSoxQOGEbayxURNGwezG4c4OAtOW6PCmn2k3o3M=;
 b=ID9uiYLLVKEFKc+M4tJiFxdx+G7jnAyNT6MAKR/DHFVn0iIWvhw1rnjerPCO8o+klwxWZ+e3vUPiDTi7Jl7TlLzYHSM4Hu99Nqm0Dn6JCdiE2RAlPKuRadn7cTbBOuqO0EuwR7xt4aBl0ZyCLPBup51BpG6lIn7bUwZe3Ww+JfI=
Authentication-Results: x.org; dkim=none (message not signed)
 header.d=none;x.org; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MW2PR12MB2348.namprd12.prod.outlook.com (2603:10b6:907:e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.25; Mon, 1 Mar
 2021 16:18:46 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::8c0c:5b9b:fec6:e12b]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::8c0c:5b9b:fec6:e12b%3]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 16:18:45 +0000
To: dri-devel@lists.freedesktop.org
From: Harry Wentland <harry.wentland@amd.com>
Subject: 2021 X.Org Board of Directions Nomination period ends next Sunday
Message-ID: <78555782-a8d5-d07f-a15c-53e3619ce136@amd.com>
Date: Mon, 1 Mar 2021 11:18:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
Content-Language: en-US
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YTOPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::35) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YTOPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.25 via Frontend
 Transport; Mon, 1 Mar 2021 16:18:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b9974016-569f-460f-de4a-08d8dccdb03b
X-MS-TrafficTypeDiagnostic: MW2PR12MB2348:
X-Microsoft-Antispam-PRVS: <MW2PR12MB234886CD6EC46E4287B591838C9A9@MW2PR12MB2348.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H19fajh+CjcL8QY87hnEf9huce7rn9wZlwvY2GD5h5R9GYz+gzshql7l+xIOK6thE030tclcEz3+O7oIX9QoO7geyTdrXFTeyXN817Tiw23aS9o0rEB0T5lqsjudiVUNgv7QM1Gto/Y/wugBzT+qdF5DwOLGvAtBh0bhmTQkJwPrTJcB0IgnpDYl4YRP1To5E4H5+uSNAJAKmhyxAwRIFQEfMERKu3fcM676C3Z2QcnNmJSIH/dLbTuBokwWgI4EobEmOvfIFk1QgEw+MwaM/gnwb5wJmk24Jyttqs+Cau/vlLjuG8xq9tpVArl6D/me4mDjwFS8ps3HtyMdvdnrKLaNIdzS2DSB7diODuRQPc6Pow5YD85KtM7Y+TgryvjA6Ge4VKJebBR83flV5wFpEA10Z9pBvGrTd6UrAkbr9k9yrnD+DQUqUnSOE+q7bw4z5VcYsmhI3HPekL86ntmIzRAsOZel4pMch6ojvhFTZBBXd/QkoH0Qnc+1c2OOliSLfK2Ho5Jg519vJHzUVQ68GpnzHfPTHDM+k+RX7XKuVCwUN4mzCCZQcA8m3Y3HvYumieYkHXGDP6wpJ/Xs/0ceRd14WkaAy/HWbDRfNmq6e9A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(26005)(4326008)(478600001)(16526019)(31696002)(316002)(52116002)(44832011)(2616005)(956004)(186003)(16576012)(31686004)(66556008)(5660300002)(66476007)(6486002)(36756003)(4744005)(8936002)(86362001)(2906002)(66946007)(6666004)(8676002)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RnpYL3UvTUhjdEl6WGVSSFZJMnkwYS9mTm5HOGQ0V0hJMUJnTXl4d2FNdnQv?=
 =?utf-8?B?aFhqTjV6bHpuQUE1ZXc5TldqY0FKNjZKajhCU1MvU0hVQVNwUGtOTzBvYjk4?=
 =?utf-8?B?Sm5RRDh3elhlUE0xUDVuWTNRWGhQMmJLVVlURHVlSWtMTEEwQ3NHVkVMd1Ey?=
 =?utf-8?B?SGhKNjl5b21iQnZqa1k0d1BXR3BNeitzVTZPWFlWaWVVQm54R0prTjdvQi9J?=
 =?utf-8?B?dzdTUDdHbFdBWmtwQ1Q0a1UyUURYQ0ExRWRpRUg1WitNRjF5Z3IrdkcrMmJD?=
 =?utf-8?B?L3oyTFRnQmphSU02cGltNGFIT0lXVjBqMUx4d1VNM1M0M0VLby9BN2s1VWdI?=
 =?utf-8?B?TkFkOHZkUlhtRE5oSWl0YTRwV3Zsek8yL2ROOFR3ampXVm5mN2FBUDlaakJO?=
 =?utf-8?B?aTF3emZabjhmdkNwY09PQWdLTVlWR01LMmwrWDhqWSsyS3laS3NWeGRZUjN2?=
 =?utf-8?B?NWdUT1ZtYkR2YXZ1MU9WTnVocGp2Ujczdzc4MjlXN3Vsb2srRkxXMGZNNHIy?=
 =?utf-8?B?N1FjWFdIUWVsblVGQko2V3ZaQks5WDlWbDBueUNCQitmTm12ak80OWFUT1NQ?=
 =?utf-8?B?Wk12MVdlOU9FV0NEZytqcWZCOGZlSUdHT1RRVTV4WXNiMkFBczU1dG1ENnlY?=
 =?utf-8?B?bGlTSEYraDBrVGZkM2MreExleGFYQVNRRVVYeHBiSzJqTENvS3ZlRE9kVkox?=
 =?utf-8?B?LzVaa0Fma1htL2JyaFdlZ3B0S2puNkFUazh0VjlNNW43L08xOTJsY25ZZFdP?=
 =?utf-8?B?S2c0cUlWbEdxanpaK2t5V25tMkZqUW9lSTJZYlVDalN5dElyN2tRQ2FNMDM4?=
 =?utf-8?B?azIvODkvK3Z1MmQrTGJPY0dRSXhQYkUwQUFTMHArN3VWVkw0ZS9qdjBuRS9j?=
 =?utf-8?B?bEZQdnNsU2RFSzBCQ3BLUkkwU1B5MnhmWjc5N2RRWGhnNERJRXNFV2F4K3Nu?=
 =?utf-8?B?aVBudE4yYTRxUEM2VGxNSUszai9XU2dHZWdKZnFQeFJwTVp3OXR0aUYza0h4?=
 =?utf-8?B?WDZNWDJydUVYaG1jMTBKajV0ckV5eVdsV3I5WlF2Y2pBZkpFQzJacTd6Wnhr?=
 =?utf-8?B?c3FFSER1ZFRzNDJWamZUMnlDelFsMjJBdStuRVRZUTZpT0g5TTA1OC9qeElV?=
 =?utf-8?B?YnBEQ3d3ZFJrMEZNRXZzTFV0TnhTc3lpRy9heGVYTUxTK3Vmalh2OC9hV1BY?=
 =?utf-8?B?QWV0VjRRNWhIZklIbERDQVhNK3lzdUVZVzgvajFvTEI1LzZNczBMbDdpbEZj?=
 =?utf-8?B?V2Y1cTM0N2w1Y05neTE5c1B4WGRxM1lOaENBUWVNdjJKLzJwS1Y5anRldU5F?=
 =?utf-8?B?c2dISW5Jc2puOUhmSThxcjAzeC9RSnFRZFVydVdvL2RGZmQ4U3ppbDVhWktM?=
 =?utf-8?B?SXFCajZGczhQckw3RkJxV09kVHpzeVhiS0pPUHdPKzExNTlUN0xVSFFjRUxI?=
 =?utf-8?B?MVNuTTF3dTc3ekhyT1MxakJkb3dmVEp5M21xelQ0K0lXaEcvWXMrSjdZRnJr?=
 =?utf-8?B?OTVvZjIwVnAxb1pVTmZUbXZqRFcybkpzdWV1ekl5L0VjcUtzbHlseEdMS2hj?=
 =?utf-8?B?YUF1dHBycHkwTEE0b1BrQitCOVpRdzJyNzNSc0Zxdkx3am5HaE94TnJKQWRY?=
 =?utf-8?B?enJUaGlCZmVRMmlHdSs4bUxlS2hDdDRpRlNMajhUNDlrd0tNME04WnIzMmdT?=
 =?utf-8?B?MHBRdnJudDR5TVRKRTVjQ2hCRTlVU0xWV2ZIOXhGYytlRVBIT2swZFNzYmNp?=
 =?utf-8?Q?rk5N2MtLCCiuXjMRyrNkgAa6/fNv3TXxKqMJPzx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9974016-569f-460f-de4a-08d8dccdb03b
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 16:18:45.8603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FAnC41gH7DqshuENd1EVYIMN88thWF6ihtscQ8/AiP9EM68IJZcbRIlcYpU9Bb2Vu0KleMtSFMY35WorzcIkdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2348
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
Cc: elections <elections@x.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unfortunately my previous email seems to not have been received by many 
people. I will send this email separately to each mailing list to 
hopefully get better coverage.

The nomination period is currently ongoing. So far we have received 3 
nominations and will need at least 4 to fill the vacant spots on the 
board. We hope you will consider putting your nomination forward.

To nominate yourself or someone else please send the nomination, along 
with a personal statement to elections at x dot org.

** Election Schedule **

Nomination period Start: Mon 22nd February
Nomination period End: Sun 7th March
Deadline of X.Org membership application or renewal: Thu 11th March
Publication of Candidates & start of Candidate QA: Mon 15th March
Election Planned Start: Mon 22nd March anywhere on earth
Election Planned End: Sun 4th April anywhere on earth

** Election Committee **

* Eric Anholt
* Mark Filion
* Keith Packard
* Harry Wentland

Cheers,
Harry Wentland,
on behalf of the X.Org elections committee
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
