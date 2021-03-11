Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E92D337668
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 16:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3976EDA9;
	Thu, 11 Mar 2021 15:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048CD6EDA7;
 Thu, 11 Mar 2021 15:02:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjaMG37FQpfHDgJ+emoiFJ8soXJUTAia8Mt5u9imOb++UcQXcszSXzjhZAqFNqXy37Ap9U4zCzoQCMgfaHYkROym3nuAFJpP/lDosSRiPXiCOeCpASC2FqD8z9GqCA968dsiw19yRUVv0MKpcnNfwT+ok5fZ03OX6tqRU0I3QcyNpxqRlfM1ozLtwVJI5I2FJ6BQTpG/JITRPOj6TYNM/WJ7sVckrJCZM+mRfvATbCg+TAqDrPb1ZBVp69kNoUo2gmfwX/yES2jA31xWVYsYWNGC4qBKE38/mVQRcU4zYK5MleUquEvnkI7ej2xQgTKS4P/bvYYmZNWdCttflwmJpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFLFQtQBMZn+zKqyb751wv0S+ElCyAN3WCbxWJ0aqDE=;
 b=nlR48SbM/pCXawTZtq565TTvNas+Yj9EUXh8uIo2zPGzL4Z/vfeu4/jQCUgMoVl69hhaKiQjhRTvZjbwqLfbJuB6whZ+KwyaEUwitEYzDnfjxc4UsYnpP9RVNPrXYrpZKOfGfLhDk3DzkRb08c7XvgGyU+2Z1VjfcNOQaLEmy4mVcVgScTHlLWa+q7m9w9L8tOAXK2WqOrY7d3vfJBN3nQpcUq8Jooug122Wt0gINAxP+Y97vWUll/7HieBeQ+Gift9R9lnyn5HkHCwnVOko6UbjtrHsul25A0/Rj09UMXQOSV3wj9oGBJDGMvtCLrZKMIU2Srt2R+dQh805UdLQMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFLFQtQBMZn+zKqyb751wv0S+ElCyAN3WCbxWJ0aqDE=;
 b=hHZPBwdbOAAQGxqFCPQ/L/+D6tVZTkUVFqTblUyKQOakRlxZFAdNd7AnphgY+AhR1SYjmVgigQbij+FZjVkFOEwoFFrLmLG3Usq6AEubkWCbnAYfm79RvHDpliBrdmowz4U9harR/+t6k8mTu/LAaV9VBb2THEK51fRWo0tjKV4=
Authentication-Results: aspeedtech.com; dkim=none (message not signed)
 header.d=none;aspeedtech.com; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MWHPR1201MB0206.namprd12.prod.outlook.com (2603:10b6:301:55::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 11 Mar
 2021 15:02:08 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::8c0c:5b9b:fec6:e12b]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::8c0c:5b9b:fec6:e12b%4]) with mapi id 15.20.3933.031; Thu, 11 Mar 2021
 15:02:08 +0000
To: Xorg Members List <members@x.org>
From: Harry Wentland <harry.wentland@amd.com>
Subject: 2021 X.Org Foundation Membership renewal period extended to Mar 18
Message-ID: <a4dece83-a284-dd37-16e9-5ca6193df391@amd.com>
Date: Thu, 11 Mar 2021 10:01:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
Content-Language: en-US
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YTXPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::31) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YTXPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26 via Frontend
 Transport; Thu, 11 Mar 2021 15:01:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 639f0d3e-e53e-4576-bb8b-08d8e49ea3bb
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB02068726C1743C13F37A7B3D8C909@MWHPR1201MB0206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o+b1X26CYuluWl7wsSN53zICrqCnSfcH8oo5hnmLbWT3M4EaPFtK0yqeo6bSPsfrTB7zh2rY65i2J8HoV5fx3DfPou8QACzfAulbFVAvror/vkfNlcKY8vDb7YZfyF2dLfGnP3pe88/bQLH2bHRjAS5bHVpigEdp19MAv4ibO6bb6r4gfUTbjLiHfyA5KB7cY/m+nDEXs91/kR67m9lpjIP7KRPKgECNYjMQExrZlYpfrJVj1prZa0icfBaXemvF3DTI8BW2QUoWuTY2VujTkBM7OakmgGNBkcQi17EMX6pFMlJyS2nYlYExy0OWyQI/hncsLUFLkGdSxqA6/KB6NH0ja5e/CSei7b9C9bDvvZsgoPsKwPifCLYsDRMqUp+dpO1JKzE9kXWVBPlEJGJvbAVgOqa80ak8q73sd8aiHz3XHhkCyB5BPJyj7teCDy6tFizxd5JsfC3tjlPi9y9lqkowFSeE84Gh2lrJrhzBH6UUni7+pzxeyfNL8SO67hI+9Kg7a02ktC+a++WRH+r8huCj/59V7vSM2w6lx1wE9BrJKeaaqp1cOhGTEkGS3SSGkJMimZZ/9g8ORLiLLC93PtUo8jOMWB78/TZDH+6FD/NoiG9A9DDgEn9vSDF6YOStJpZcIraFqFyAZom9kqV5ZOfvFQSdFKvWwVzeiAxrUFwJlM4TKE5M8NV3ip8epQUH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(36756003)(83380400001)(7336002)(54906003)(478600001)(186003)(44832011)(6916009)(66946007)(2906002)(7366002)(956004)(5660300002)(8676002)(316002)(86362001)(7276002)(26005)(6486002)(8936002)(2616005)(7416002)(7406005)(52116002)(4326008)(966005)(4744005)(16576012)(66556008)(31696002)(66476007)(16526019)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bmNWQ01YVHc0YnR3QXNxSFhHT1d5NkhCQUVpa3RNS1oxMkw3SkRWbHFTNTJS?=
 =?utf-8?B?QklWZWxOcEdFeUxsRzBBV3YzeWUxRGtwWnRaVjh4NytZWTBQRDV3NGNBWlA5?=
 =?utf-8?B?ay9IWXA3VGg5NEVLVTVFT280eGdCYTFKZnFEN2dXVFR6TG8wa3BRYUhCMmRz?=
 =?utf-8?B?dWhXeUY0ZTkzVWlxQVYvdUViUzFOQnJyTjVHajBLSnhGSnYrYnNUclVDK3Bw?=
 =?utf-8?B?RUZuYXNuRnlETWloQWQ2bWxVRnNCRlFva0I4TEVrSEJoOE1vVk5PcCtWQkFC?=
 =?utf-8?B?VC85b0ZZQVpEcmVCTXpRd1AzOVdncEJiU3I5WFlPVjc5ZlV1QUxKR2NNSkU0?=
 =?utf-8?B?MHNiNGFmT0JMNktEZDZXaElHekwzeTBHOFFLSnVuQUhGU3BnT0tUWXdWWFJZ?=
 =?utf-8?B?NFdlOExoSFpjZlZLWW1jYjEvNitxK05TY1BiR0xobHpsaG5xUjIzTXA3U2NH?=
 =?utf-8?B?L2dlL2JaN0tseDhtS212ZDZpMzVsTDdCWmMyMkFoN1hQUEVZMXhvRjBpN0N3?=
 =?utf-8?B?ODlya0tpMWhNQ1BCLzF4Rm1yRDZVMU9qM3duY1BiWUhySjhqczlDaXFsREFa?=
 =?utf-8?B?VjlZY1hrVzI1QXBNYm5HSHhyUitaTDUzM2ZsaG1FdGxmaGp6WkNQR2NTK2Nl?=
 =?utf-8?B?d0taOUJXN1kyWGt1K1F0dVMwY1k0dThZZXhwSWJ0V21FUHRack9iL3RvMUxO?=
 =?utf-8?B?OFEwUCtWMUV2cnRXb01jaGVVT2dPUlh1MENhbml4MU5Ic2tFNGJPWGdZaHN2?=
 =?utf-8?B?eWZVbjdUQVdSVmdZN1FoUDJUTWJRZzl4UDlGRHd0REpDK0lQZ01rMVZ5bk5Y?=
 =?utf-8?B?NC94TE9GOUQyWVh1U2VhSUJUdi8xVERjaGw2Y0hZOVFjeEx0WndKSVBMeGlh?=
 =?utf-8?B?Q3hybmtaTDBBUXVRSjFLQitYTFZVSjZoOC9ITENzb1F1MWpJVHNjWjgrdGg0?=
 =?utf-8?B?L0dZdUkwdXE3RE1mZlNUQ3VFRmJiNTFCWEh5V09MS0RYdkJnTk1FYVFuL09w?=
 =?utf-8?B?MUowRzZZaDh1aU1RS3pvd1pIWDJocEIwd01DQ3MyZmZ6UmNRNUd2NFJyWFow?=
 =?utf-8?B?bWRlaEpzL1dlZklTdUpweDJTd3cyKzBGbVpTaE1wWWZpZHR4WEpMVXppWHZN?=
 =?utf-8?B?Ris1K3N4Vm1ncFJ0MkR5SU5NS3ZLZVhKd3h4MTltWHJrZ0Ewcm0vekd1QXpX?=
 =?utf-8?B?a21SWnYzcnExRzZ2amF3cWJ1TWhPdENNM295RS9JbnBYaE9LRjFyWndRSTZM?=
 =?utf-8?B?UkQzNDBGdGJHb0dYck1Ra2NxdmpmcFcybU9aNFdsOXFRaVRzKzRTRE0xUWZH?=
 =?utf-8?B?czFqeHpNajRkcnZaamY0ZEJmRnpmcEZTZXowL0RUOWtPNHVOY2o2OThoUDVW?=
 =?utf-8?B?ekxvaWpjNER0UHFZTW9PaXU4UFo3MFZ0aktiR2p0K2hJbEY4VVlKQTMyTFQ3?=
 =?utf-8?B?dHVzNGQ1ZDBCRWxiL1lhRVFWbXFKR0VQb0hKcTBjUUNmS0twUVZLTW5TUDF2?=
 =?utf-8?B?QjdkbTBsbWFYVmtCNVJ5TStDaFdDd1pUVHRyVXdCZERRU2RSeWhDckJ4L0h0?=
 =?utf-8?B?bnZ0cHRPclgySkFSWnRNalJYdGNYQTEyRlNOVFRsSkFYUVVTa1FjTWpyYXpV?=
 =?utf-8?B?cnVUK2hGMmp1cnVvaURvckdGaU5YTm9FcE9RcXdLTWFaVmlLRjNuOUFrZTg1?=
 =?utf-8?B?cUlRUGV5ZzRFblVQbTBhdnQ3cDgydXpKWk0yWE5GUEpyYXZWRUdqYVpEdlRY?=
 =?utf-8?Q?J39bkb2VVmEYhBAw6DKHyAK9A/teyRtRcyVqAuR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 639f0d3e-e53e-4576-bb8b-08d8e49ea3bb
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 15:02:08.2252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +p2zX89ruuk2UITUyWD+N5ESuOO4+FUv0/qYFOF+dlf1+JUhzgSjGtkoRJMd/l6Bt6uI4CyToyXznX61FDW1yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0206
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
Cc: "xorg-devel@lists.freedesktop.org" <xorg-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>,
 elections <elections@x.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Due to some hickups with some of the early election emails and the large 
spike in membership registrations the elections committee decided to 
extend the membership deadline by one week to Mar 18, 2021.

If you have not renewed your membership please do so by Thursday, Mar 18 
at https://members.x.org.

The nominated candidates will be announced on Sunday, allowing for a 
week of Candidate QA before the start of election on Mon Mar 22.

** Election Schedule **

Nomination period Start: Mon 22nd February
Nomination period End: Sun 7th March
Publication of Candidates & start of Candidate QA: Mon 15th March
Deadline of X.Org membership application or renewal: Thu 18th March
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
