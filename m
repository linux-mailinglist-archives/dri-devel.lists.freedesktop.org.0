Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 652663193DE
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 21:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF956EE7B;
	Thu, 11 Feb 2021 20:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDE16EE67;
 Thu, 11 Feb 2021 20:05:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMPQB4lAQoqrT4KCRHXBpy14/8v6thqv/5TDdnZLzJLWkjnZUd5zgjoDc7myEord7VjPAKdZnhm60i06s3YlJSA/BH7kI9BNHDwigNn2ixW7ElfupjQjcyAEmosx35HODmv+CShuYSWyjENBGJTtQ1BXFm5yP/cB93EaaaHSZHQaXWX1j1tjuyF7aPEQSVUOA0wBJ1uGBYkvwonSWi1OnMrbD2wq6m3fPgG8lOGUymRMpzPrnzMXAC9oF1NIQLiBh8P028/Y+h3YbKpqigFWOlb2NFJoWzcYTBCgR1GjqxPkh9zxC1Ijr//ZZGGTZBUKyAuhndnAjY0ZBWFlJDvRjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5/Lum2saDzvmnO9CXR9aKtcHxOkb9Gk25dZYlBzwUc=;
 b=C7s5JsCaBDfXm3tVvhy4iIl78vhC2CwbGxJCotzZN+JMOhuZKWhL9CUmoADMUfq+WkNDotjkmW0vcPyMxU1Ep2m1eap8OirSVTtSSJfBJVy2LmVpcnzQK98lhUzXU6rVhbSy+9e+AxDr2HNdDtL4NEMSLXvRpzZM9bNWmj1Djo5JGXqrayVuvC5YksNkXlOCB7Gzwi1/0jSHfply/PaZ/e5DwKP8dENhdCO+4rriP3xTYI9MdffRij7M36x1V59RaYDv3KEn+05Va+Tz3odbaSWrsgTmeCZdZgImDAWLBzo3H2RoVRB4yqlvyces/Xlw7pB3/teMeXhX6X8jwJAYdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5/Lum2saDzvmnO9CXR9aKtcHxOkb9Gk25dZYlBzwUc=;
 b=EvMBN/tabozok7aPAp706EacXa75mWY1k5ldxh+/wCSeW+lXK0FhneGOzqqSZloMuOrtyBv79zZT25zTFEDb80bJTfhSdO/l0e/APoihFCU1g66aWtmyPoC1hLuH+xWVlFSWqsTDlNInsxAcJFuPYT67LWjnsbjOtT/u4gDmZLk=
Authentication-Results: foundation.x.org; dkim=none (message not signed)
 header.d=none;foundation.x.org; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MWHPR12MB1807.namprd12.prod.outlook.com (2603:10b6:300:113::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Thu, 11 Feb
 2021 20:05:14 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::172:235e:14a4:bdc6]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::172:235e:14a4:bdc6%6]) with mapi id 15.20.3846.029; Thu, 11 Feb 2021
 20:05:14 +0000
From: Harry Wentland <harry.wentland@amd.com>
Subject: 2021 X.Org Foundation Membership renewal and election schedule
To: Xorg Members List <members@x.org>, "events@lists.x.org"
 <events@lists.x.org>,
 "xorg-devel@lists.freedesktop.org" <xorg-devel@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org,
 "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Message-ID: <8549250d-8f7b-33e8-2926-1dc52f9e6f44@amd.com>
Date: Thu, 11 Feb 2021 15:05:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
Content-Language: en-US
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YT1PR01CA0086.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::25) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YT1PR01CA0086.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Thu, 11 Feb 2021 20:05:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5e8979e4-564d-42ef-8154-08d8cec85858
X-MS-TrafficTypeDiagnostic: MWHPR12MB1807:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1807FBB2F7F5EB82DB9980D28C8C9@MWHPR12MB1807.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7p/LZxQOVn7gw4SMj7q7zAVK5SHFjUy6dEOL6vGw5DvASvpyFKQH+M3lyK41fNtU/AP3R1AaT6dYKyAC1xWHR4CQbbUNg03Hm6/nSPcHnPW+TelK9By+WtersyrsT3jz3h8aheUzwL/U6BCUFFcIv471/QgjbvQzOweb9Cfytft+R0tDAkh4jq3ENV+e57nbSdq525DP4434uCEQpQd2lFwpQCrm9TfIIvLFyM14fMe36httX9+ulnnVMbsTOvmtQMAujmR2zSVg7gibIwpD7ABqTkOeri/fb5z+9Vz7xAJgJDEiOpRDpmSO0VP5CRvytEnPvZ/tTBQE2uK9ka1MCqmfWk7PxFfe4S1v3cbDBShwfBEsOond9d99PfZJW+vjt4ufcDOAFh26ZagufwIeA1ijR+X+QD9aNw7UdcruN4C69xyx3Z1a1DSvJnVqyZceX9oKjZDpjPJS+NssTZjD0KtYT5zm5Whq5TQRmz3JUqnmdi4cF2ag3GJ0no2ZmhCzFgFf/wJ4WJ94xeyX4Rq49W58oL1VBMaTzpWvvYqgvXtc/D68AZDj2+eBl6VptjyFIoT6sV56oxIrdaMPipDcq2B2WBqNQYV8WEsiPAlShY71iQGlZe/W3QaPD2j+X7I+hR8LGJjeLAN2gUvipz0LTrAgrhK/rMMZi6e8JHXEf8k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(396003)(346002)(366004)(52116002)(186003)(36756003)(6486002)(478600001)(5660300002)(110136005)(66556008)(4326008)(966005)(26005)(7416002)(8676002)(66476007)(86362001)(44832011)(2906002)(83380400001)(16576012)(66946007)(921005)(2616005)(31686004)(956004)(8936002)(16526019)(31696002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NDkvNTRGUWYyTjlrYks1S0tRdkwvZU5zcHlDVzZHRlQyTjRneTVldGhNM014?=
 =?utf-8?B?eVhWWU40aCt3eDNqRmJQQXlHZWhSeHRNM2x1bkNacE9odnB0WDY0d2dTNyt3?=
 =?utf-8?B?TXhWeUdNU3ppODg5MWIyeXpDSUtFRDVBWFVXejNudzBMVTZHaXBYako4U3dl?=
 =?utf-8?B?NkFHZlVoRnhSb1BycG00U0JSbTN2bHBCbWFFSmZsRHo1U0oybkV6cGwrb0Qz?=
 =?utf-8?B?ck5lbHdMWDdkQ0E0ZjNvVGJGTC8xVmRVcmMrRjFtMHZjdkt1RXQyQTBNZ0lu?=
 =?utf-8?B?WUt0UGlaZzYwUTRMTnVDYVdISU5QQ0swY2RLMkZhVFJoMFdWdXJ5d29aRWs0?=
 =?utf-8?B?WVRySnlRUWlMTDFTbUZTemJHUGZEa2NDS3BNaHR5ZzMvcG13N05iZlFoekRI?=
 =?utf-8?B?K0lPWDA2M2M5SFdmSVpjRS9TTW55bVF6ZFlVcmU4RXY2UGcreXJhMHhOY0xt?=
 =?utf-8?B?ZXhGbW5pWld6SzZFVTVmelpvZUowSFE3UHROd3FxREhaSC82MFhUWEhna0tr?=
 =?utf-8?B?dDBaK0Q3SU1VRldKaHhXa3BGaldxaHZ4OGZ0U0NERGNHeHN0SXE1dnMrSE5y?=
 =?utf-8?B?bUF5UlBrajgyRGRMdUhKbGFUSHNvdzFvR3R6Y1phWE9oYlZ6UFJLTlMrSzFM?=
 =?utf-8?B?SkhwZ2RTSm1FZkhFcDJEQ3ViNjNxZUpsY1cwdURMcndWYkZleWxJTlFBcnUz?=
 =?utf-8?B?Q2tPMUJjNXd0UTVMOTR5RWx2U2U2OHFxbHJSN2tWdzFtaHR3VXo0aFZySlJX?=
 =?utf-8?B?SFJwTG9paE5rYVVzeWJWbmNwNWM1TWdLRGp3ZnlDRi8vWE5KSkR5SXQ1cUJR?=
 =?utf-8?B?SWNRWFU4RGVEamhCa0o5UE5ueHprTUtCNTZOamNjclkxNk9KUXBweXd5aFJV?=
 =?utf-8?B?SUhuVXJ3MlI2dUVKSEpySW5CZFBrYlR0Yll2WE0zdXBXTUh2enM5OEJzTnc2?=
 =?utf-8?B?TVBaeGxpS0pLVU1INUViVzlQWG1DeHIrRS9BblRQNFJkVEY0YnpOMnJPMFFj?=
 =?utf-8?B?bEdDak1LYlIySlNIUVhTUENsc0pWenNXS2ttRVJjUElrYkg1bmVjdnJkbkJY?=
 =?utf-8?B?elN2NWkxZG1sRlp2TEkwMkNWNHgyL3E0MVVCVTBWSnc2b212bVVPQUJNckV6?=
 =?utf-8?B?K29YbDU2dHhCNU9TTjZZMmVhMXQrMVE0T1dOcEF5UW9aaGxsRk1jbE1SVjFZ?=
 =?utf-8?B?Q2V6OWdZYVYvak9MZkNSLzN3bGhqSWxtNzQ2UEhHWnlpbkF6K0tkMnh6djlO?=
 =?utf-8?B?ampqNjBxU3MxcndKTDBSanVrMjFpN2g2YVcyTXFueXd1SFoxZzRob0phNjNv?=
 =?utf-8?B?a0s1eFVMSGdQR1BQb3JKTVlWYU02cTRsQStGWHNiaExPdFdBbThOTy9ha3I3?=
 =?utf-8?B?b21rdWpPM1BYSkVxcG03L0NsTWN6YTdTQVU4UVE3MkM0b3J3WDlZMU1YWEZw?=
 =?utf-8?B?LzBwQjJWY0ZoQjlGdkVQb3BYREhVZ2JWaFpiM2JZMC85c0ZLc3ZTbThvcHJF?=
 =?utf-8?B?bG1hQmUzdzBITkthanpOdGhaZW5aQUkxZlhkaHFvT0lNTm4vVUxuS1FPV3ZN?=
 =?utf-8?B?YVBVbG05U0FTUHUyTUxYM2dOeDkwTXNUZDl6T056dkJwNG0rMTFqcVZHM2xE?=
 =?utf-8?B?VU9LblE2YVN4S3hOSjBzL0JIWTV6c0NyU0MzdWNUUkVsMHM0S0F5SUZwVEpS?=
 =?utf-8?B?UlVVMkRiRzVTbU5xZlVJRVBpWkxFS0RMWWh0dnVzTXdkNmFkM0EyeFBGWUds?=
 =?utf-8?Q?LgwfleoI/FbSQSlT7Iy9d2miggZTw1WSowiPHdw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8979e4-564d-42ef-8154-08d8cec85858
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 20:05:14.6201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HsSAWj/G8HsJz+dToLDu0yb1ElOJyM0S2t1AqYpcsLRudp3P4rTcaoCTru595hfw6w6FjrfILD4RPYisdKvDvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1807
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
Cc: elections@x.org, board@foundation.x.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The 2021 X.Org Foundation elections are rapidly approaching. In 
preparation of the elections we would like to remind you that members 
will need to renew their membership each year in order to vote. Please 
take the time to renew your membership by logging into 
https://members.x.org and clicking on the "Apply" button to apply for 
the 2021-2022 membership.

We would also like to encourage you to start considering yourself or 
someone else for nomination to the board. We will send another email to 
start the official nomination period when it opens.

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

Thanks,
Harry Wentland,
on behalf of the X.Org elections committee

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
