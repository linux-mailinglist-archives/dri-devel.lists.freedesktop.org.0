Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A89E445353
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 13:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503B66F452;
	Thu,  4 Nov 2021 12:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2054.outbound.protection.outlook.com [40.107.95.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B46E6F452
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 12:51:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3ZI+K62jG1+7l0bJP8l6z3g8J4lohsZxZCTCFSg7tu6Fu/hCuHY4LqgyUikPQMzn9VEGFKnZZQZtXqVx6gNvonlRy7xlDI1WseFBYnKwDyaZ07WWJAlCpEq8/wjYDpeVghSCRgN6D7dUC4fq7QwAM+Z8VFhKWNY5WZt06HloRwfdM6l5fV6RYxgevD6qYNqaZjOYYUGuNf1UN414bSBMWXOH352bsUg16CN4jLTLolEnrtGsZt17qpX+WkHPvBEglHmjVzIP/YMB54BObRCYL0dwaxBUxBwkHhDSgznEhHmtQEdbTWgwymnDjpYIT3wN7crDtaPdKXna+sMwEBiJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39D8vcTglUufwHGrTWGt3Lvt52EOZ5dVyKFG2o0EmvM=;
 b=c5XpiNsY78Jq37rJiuHoBZyTWdXgA0+u2PItu9gzT1kkgslg2c32v7FTliNPtzjbY/BEI+2wBDlCIyAMkuHvanpjwUvslkPx5YvDxYM9eetO355OJUStzIbOZ7jVIsOfpL6UM2pSPWsFmTKYUw4ZD41a69TgghqjlTJtLZ6icAeEBvuskbqUcGzvawvLjjigXj4lUlMMkedBAx1lMPkDHS6TV6cTWWNq32KsN5c5Qr7d+8fO661FbS8py5xPlkfHpliv3aPAzF3EyC89JB9UcRXAPV9w0/8aUaXwj+7JBwr8tp3oX2SujYMnOJkF5VYKom0gy74SP3y5kjc7bLLrsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39D8vcTglUufwHGrTWGt3Lvt52EOZ5dVyKFG2o0EmvM=;
 b=pLIHQTh0qhIwbk8POQf+EsK4Hkwg2FW5Oy6GpesG/6/x6x0WBgEIOdKJ5aDTLac/JnRblu/MpXjEW0v5Cxg+xu4erVVT7cNUlcoMpoAbstH1M1pp6Y+jb7aa1dAAfAYtLtQgZGUW/oDCrXdBa96xBOvPsjWjrKuHcbvbjdY15MM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1679.namprd12.prod.outlook.com
 (2603:10b6:301:f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.19; Thu, 4 Nov
 2021 12:51:55 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4649.020; Thu, 4 Nov 2021
 12:51:55 +0000
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 "Wentland, Harry" <Harry.Wentland@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Subject: Questions about KMS flip
Message-ID: <579d0f44-bb85-11b2-d326-35a0b7c5d0de@amd.com>
Date: Thu, 4 Nov 2021 13:51:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM9P193CA0016.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::21) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM9P193CA0016.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Thu, 4 Nov 2021 12:51:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 098c5d97-d75d-46ca-2f97-08d99f91e12f
X-MS-TrafficTypeDiagnostic: MWHPR12MB1679:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1679B2DB5F4A92F538836D3A838D9@MWHPR12MB1679.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4jtDt1eKRn94lIAh80MfUvZzZxvnId49tUwqBLz2mr9+3MM7Jcan4Gl04zuuvW8iO5LW4irKQXG6j4UxcbOA1kjfaTsTAn8U/PAu6uSikUkhPBza9x8WDCEptvMFDWd/TX8/qakFptcSCYbpNm21oOYnGmtFUBUiq2d20tg0cpoG4JoERzU+CFIK3uHf6qOsN1yb+zRFhVbuJN/P+w9hOCaIuKEEzo9xesCq0A7dEv/FIOBewo0/Owrz9zJBMoT3Qib6LBLX/Y8VvOIbis9McTSv6J5jvT7XIx97myHFBCLFvJbcf+g333opfP4sMsipriWb0MK7jeXHtMu1UYva+Nyjqz53iyv8Nvzav/WoVCnhkVimKpy5t/6XfhoGa5cEjTqPVODr3G+C9owk8ScXb4rke2QPlksFxzZigZj1rd35xjrSsHuN9RJ1npEpeZuRZZPD1gqMEpe3lEabQBJ8F/A607kAWyOPuCbNYKUB+iNEU2OeT1mp81Ukh5Jj+ZJLmQb9dfz34joJY9YjeIsqWtRbI1nW6hao4E+XeK9LHcPe3eEBnTBXbe8a8pxoUwQWYSMdrqjWgHbcoMJleRewGq0cIZG2UBSdKCWNEFoTxljPiE+9oFim/g2CFocR53UWYhlnjoR564kbeARrO7eQfy2EObBq0S289Se6Mz6cfPmSO+OhlkVTyFmsHu7InykPLIErRG/biNBixK47QzLnTTeiVt2tpc+SrDNcevXQ9CeomykrPhH02R4bmTdkQw5g
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(110136005)(6486002)(86362001)(3480700007)(83380400001)(2906002)(8936002)(6666004)(2616005)(31686004)(558084003)(66476007)(38100700002)(8676002)(31696002)(316002)(36756003)(5660300002)(186003)(66946007)(956004)(16576012)(26005)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGRLTk1nU1dCUzYrYkUzcU1MbVlSYVNrd2JlQWVyNVdxeVkvYUR4eTQ1ZDlP?=
 =?utf-8?B?c0RlQzJLQUk4UDA3TG0rRjBCUnJyMGpqeTgrV1QxTktyMlZRU080eDRsSlFs?=
 =?utf-8?B?KzV2VDlTSGxHdGNxeXNTTURaUTljYWF2NTluTzJyekVTWjdGdjJCdVMxZDNz?=
 =?utf-8?B?aEcyR212ZWRsbmhleHlVZkR3a2g0c1lqUTQzcE1ZZGxwSGtxWWp4UmlkZzhi?=
 =?utf-8?B?ZHhiMWVQQ1RBU0lKemxtWXZqUnZST3d2M0VHbHM1M0VDWTJFYkFDbGNjZGxz?=
 =?utf-8?B?V2tjSFVRMUhoZzFpMXROVXhLbGhOa3VLVmJiVWY0NDBlb1ZPQ3M1dFpudkJE?=
 =?utf-8?B?NlNqYjhZNWRqN3psU0w4VmVkRm1FaUlEc0lmK2x0ODNLOHRTSTNoQTRtYXFy?=
 =?utf-8?B?Szd3RHJkL3FxZ2FIZnhMMDI2SUpJQUFRMWw0TDFkZnNOVDlFeVFwR2U2c1JP?=
 =?utf-8?B?STd3c3hPd0JuMWR0VW9wanl5eGthcmhocGI1cVBzeVZmcVdQRDczK2JjVTNj?=
 =?utf-8?B?bDdwK2FjRDF6SkphVjdCNmI4QU56ZVpvcTBhbVR3SHh2K1ljZHVTVlJYVHVp?=
 =?utf-8?B?T0VVMkZtR1VHckQ2eVFNc0xtc2pZS1FEblpJREwwd2xQNUFRVWhPTGlGYTR0?=
 =?utf-8?B?b1ZHT1FRNytEcktSQXl3QkVaY1djeTFMdVJha3UzWTJWRFBqSllSTTZjeU1l?=
 =?utf-8?B?Q3JVLy83Wi9UQnV5b0RoL2NmbkdQYWpyVFk3bWVOT1ErSGh3N1JkeU5OdFVz?=
 =?utf-8?B?RzdUZlcrSUpjWFJHUEFiUlc2NmdBR1RzRzR5anV4aWtQa2pGenNINUY4N2pL?=
 =?utf-8?B?bDVIVHNaVXlSdVFISHRsWDNkOTk2cmJmWHJqV25jcUdWd1hWRDNtRVRHbGdS?=
 =?utf-8?B?TWQ2SkJRdHF0MVprcm9SRWdaeHljQzNyZ0trQS9IempoR2g1TUtBZDRDU1JN?=
 =?utf-8?B?c21lN0dOYWZ1NzZQR2pHSW9lVGlnUHBnNzJ4dDFuakgwZU14VzMwZ3F1V29u?=
 =?utf-8?B?Tk1VRHhiVEVEUkZqT0ZyUTNqa3JNdTloeUdHNUYwM3lXbEg1NDh3ai9qZU5O?=
 =?utf-8?B?eG92NjRTU1oyYjRrK2w4cUxOUzM0aUQ0N3I2WGJWRi9EcWxzcWhsOEVhY0RU?=
 =?utf-8?B?U1N4Yk9pQTdOWm1PaStNOEVxTGlkaEh2OEY3QzRWNVo5V05aRFFMWE5rdkNB?=
 =?utf-8?B?TkhwZUhpcnNCUG53U3R6UG5jTDUzNStVNS9qNURudUZkN0hzMlRUOG4wZkdq?=
 =?utf-8?B?cG9XM0FtdkdZV1JMV2ZHbDJNc0tsL3Z6M1R2Y2hnaFhaZzA1MHI5UEd3Q1Fh?=
 =?utf-8?B?VVRxZ2JET0haeEI4ZC9ZeXBjaHZWaGd5SUhxOUY5Q0pPZWdNbEpmc05ibEJk?=
 =?utf-8?B?Q0JFdjZxMXpiOWtHZEdKWDk0WXE3YndFKy9iTjF1cm9naEZzU3NIRUNLMEZJ?=
 =?utf-8?B?VG5RZ25VaExYaHJxbllnV0hOL2JrUS9lNlFha3Q0ZkhnVlJXUGtuNEQwYktO?=
 =?utf-8?B?MGZsVlp3T01iZ2o5eHdlM3NYWUs2LzVBUzBlcWc4NVJGeDlUM050OHpJQjFC?=
 =?utf-8?B?RnZGZGt3WG5HVW11UWs2VFlVamhiNU5UdWpHWFRrMVl1TTJSc2t5Slh4cHlN?=
 =?utf-8?B?UTJDVkplVXhiYlBSb2Y4aEhtUDlZNG4vUHJ3eW05VDB3Y0sxTnVDMWJLQzVM?=
 =?utf-8?B?Q0p1RVlmcFZyUE1JbzVFRXArMm1rUTdtbGhoZEhTWmp4MUNnZkJac2NIQW9j?=
 =?utf-8?B?TWZ1MmNKUW0zTnNrMm12OXBDR0lhSXY4V1hvQ1BBaVpmQWN6a3BBTENGSGli?=
 =?utf-8?B?T2haYTJEVkdxbTNaZ05QR3dUTExBaHhvNGpKS3hZZmZ0SXFnMG1kdk9YY2lI?=
 =?utf-8?B?SDdCaE42aU5PQ250SjFRRW1XaDhoVERUVUwxdU45dlNPTjZ2Vk1reVh0SytL?=
 =?utf-8?B?ZFhCVGZ5ZkgzT2lvTHkzbnBVUGpkQlUxOFpoOUQwSkhFVlpyZUVsTVltNDVp?=
 =?utf-8?B?V3NJMEpDbjZDaGlXMWR2cFltVjdJcTlSYzB1MW12MDg4VWllR0g2RWZadjRh?=
 =?utf-8?B?eFluK2RzbUFmVS9LWE5oUHZ3VzZwcUlZQVV3SXozRStScGV5VkZlZXBrOXd5?=
 =?utf-8?Q?WdKk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 098c5d97-d75d-46ca-2f97-08d99f91e12f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 12:51:55.0194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2p1u6p8myva6My6zTyEFujYEJDsnwEPGQ0X4BFmAl9TFQfU0BF11hgw4uwdfylI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1679
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

Hi guys,

adding the usual suspects which might know that of hand: When we do a 
KMS page flip, who keeps the reference to the BO while it is scanned out?

We are running into warning backtraces from TTM which look more than odd.

Thanks,
Christian.
