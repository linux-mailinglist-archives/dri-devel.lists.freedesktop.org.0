Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A83E54B7C61
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 02:31:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724A910E5E0;
	Wed, 16 Feb 2022 01:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BE310E196;
 Wed, 16 Feb 2022 01:30:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKrvyvYhj1UhfAW5Qj+HpWbKaJ3o2EfLQxXevcIn8JbY+BWcIE3/GK7AzT+Pvz5R82J9mijcALfsjYclnBVQc+bZQuH9ygsROPsn7J6YBmTILy6i0YgHj87x1QJkD+yVE1e+2DlFOysITu70uK0rOdxeYRGiiBoOeiCL8ICKlimv8T0vl9UDj+X+INxpwnSS3ga2vwybNRABgfryWOnOATyX7QmHS7Mu2tlnUELZCxdmOE/SgyYZnK1WpXqGVvh9vvKr1/rYb6/lXxbEKzp2/hLXnAldkGh+6nO2RnpVPp5OpsNmfg4irQn0iWDAyZOA+IWuwT7hUrNMVfd6kvSCOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMKHz6MCt4mLUa7wK961eqQPsnk5roP5snaMiV4eRTM=;
 b=eI+fJF8yBYXgidhIPmr6gbvpwFF2efB3AwM9drlH2LhH9PEa9oEH2hY/oFXusgNUPkOy5nzwZ/kGWjqs3cbJ6RB9sMzFl5SOcVsIiBzQDAj3F43M0xiLJ1XKhObk4dOmr1ztVfe4hIAoLYMbgEir2bLLRfQ8xLrlQMRaWSZ14aiL4q8DAvj/UeovfXSItu6dzQ4ZxFj7zK+LbF6GNhL1OmCO/oCJHjM+aFbkHLuvGs+eXrs3wFFBQeJjGzpcYsvm4/c+kRhTc9QaBSNyIo79B6WyRqpIfjuVLRNOa7a0F+erj8DBa14IFMvidcL2o/UisMqd3vy4gNEe/CbBmBzcsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMKHz6MCt4mLUa7wK961eqQPsnk5roP5snaMiV4eRTM=;
 b=OT+4679YhuIh86UN3k0dcPVNfWWSs+yCs/TYMOrZcc2qVFNsfKPfVySJ9iXNShBYstcLeE5/Ugs2XwQJtsSjs3xDZQYP5v8255W1yB/6F7M4TfRpiuSnD+Apw+BD32qML+fqocT6pF3VAGQv3VMdwV6W6wiDBW05OUJvR3HDbQs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5149.namprd12.prod.outlook.com (2603:10b6:5:390::14)
 by MN0PR12MB5764.namprd12.prod.outlook.com (2603:10b6:208:377::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Wed, 16 Feb
 2022 01:30:51 +0000
Received: from DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::ecac:8946:43b0:c1ec]) by DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::ecac:8946:43b0:c1ec%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 01:30:51 +0000
Subject: Re: [PATCH 1/1] drm/amdkfd: Replace zero-length array with
 flexible-array member
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org
References: <20220216003841.1419615-1-Felix.Kuehling@amd.com>
From: philip yang <yangp@amd.com>
Message-ID: <d4f41246-8c32-b711-7cf4-e28f55535ddf@amd.com>
Date: Tue, 15 Feb 2022 20:30:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20220216003841.1419615-1-Felix.Kuehling@amd.com>
Content-Type: text/html; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR08CA0023.namprd08.prod.outlook.com
 (2603:10b6:610:5a::33) To DM4PR12MB5149.namprd12.prod.outlook.com
 (2603:10b6:5:390::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e787cf46-6922-4bfb-cbb1-08d9f0ebf6a4
X-MS-TrafficTypeDiagnostic: MN0PR12MB5764:EE_
X-Microsoft-Antispam-PRVS: <MN0PR12MB5764C667EAEE687EFDE14C19E6359@MN0PR12MB5764.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9YmZRDFllp2mBYir+2YxibILjdMYr2CNwbElhdfyXfuHAW8xJQFl6lBzoWTLU8lZ873tx/Y6wBykbiMENXCL4nKK0IQjvOUEWAocIXt76TDy/2xhv/4gO4IrsBrJ8i5HZ129t1ctBj98ncR+CnjEwcDzvWL0M34TZahlaJ1etVn4A8d96fPzVtpS+W0T1COCNNphPRL+c4/ILl96iIgsEdRur+tgiWE3DelhX6GpLbNHRd7sIi3aclCmS0dVDnobG83vMEw8Qwm5H+kopqTS/M4HkmFtLriOU7S9UzPgxf1YdWw5fxVW7BzZtd2Ydh0qzynOG7DZyEnUbJgY6gDdYkmlaXQ5b8Tx8q3RlEBvG4LGbqJ9lvavp2lfIUNCY3ChmB7a+p3jDl1Xk9KDVqtmfOO+k1OdR21uSG/Z2ZyGxpzqbjqfYvbWNAhFyv5sz3iUHhIjUZa15oFCJWSIQgV9uGGzh09N4AyVTlL1NHOT9OXq9ZyJa0Th09F+sz3Xz+S3ZWqLdHj6ShsijO2CANpCnZDYDIx5eUhYBC89ZrTaPhY3DunaiknDldNmlPg98Im3psWX2R8vFYsc2IPnWIZGfObrNQnlucZH2dgn8XgisJHaYLyZxBXaDmxi7iaw7XBvQnPGfBhESdkFjsIsKv30p1ys9+bbEPB7nMSX4hUhu2IJiB740oM5uPbupOxRXnGD5/FFemqpXnOXH9GftSBVbwtTCGn4a2dHlqNkL4Zc3jbVIDVg7PuzzuO5YRx3sW5v2gik8cPOxd+qmo35y4Dn25gAiL/Z92O7ojAmCKliB7fybAExUH7m/p/GTgLxKmD9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5149.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(4326008)(66476007)(6666004)(31686004)(6506007)(36756003)(8936002)(186003)(6512007)(53546011)(26005)(2616005)(166002)(4744005)(83380400001)(38100700002)(2906002)(316002)(6486002)(66556008)(66946007)(31696002)(508600001)(966005)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3UxakY5N2d3bDBiTnpuVXlQSnBWQUJvWjNsK0pPSHB2ZUt1dE9XbWF0MHFt?=
 =?utf-8?B?bVF6enpKZTZmS2QwSjdYNlVxMTRHRVVoN1Y3RVRwaHFEUGxlYXFxcC9nODAz?=
 =?utf-8?B?R3ZBSndXWnphWmdBN1ArczFXaXczb2RSVEZiTldadHRwamNHN1U2QVBBK3Bu?=
 =?utf-8?B?UzZ0a09TWkU0dS9oTmNDUmNhS3ZPcGdyblg1Z3hyYWhQYVpPd3RBaHZ2eURu?=
 =?utf-8?B?NVU5WndOdWRwdFRxSmc2MGpRUXVrcWRvREp2YTZaVE9QTFJQQnhOUTVoWWNE?=
 =?utf-8?B?VW00U21selNzcXprQ0JGbU5HSlBidnQ4TGU0YlUvZ2twejJVYVVhSC9pbmxp?=
 =?utf-8?B?NENvUmpua2hKb05GaVJkL2tCUURTVm9IcmIxWlpGSFpISUNKNlhSaWFwd1Zz?=
 =?utf-8?B?R2Z2VVdWUHJib0g5ckJrOHRXZ0VmNFZRRlNSa0hlK1dFY3lPb3BKWTBjOXFK?=
 =?utf-8?B?cXkybUNmV1UvS0QvaERHYVVPUG1QY3pBaVhXKzJPc0tuY0JsRjU2VTNhb1VM?=
 =?utf-8?B?R1BxWHdXcmR3QUF1ckpKSjg0cGhSdU1LSktWT3ZJT2p6eEN0Z01NNzZndWNJ?=
 =?utf-8?B?Smh0VUJodU4rY2U1amt5UmhRRDU4ME5UTEpSQVlHTUYwSi9LaGpWRUZsSzd3?=
 =?utf-8?B?VVptWWlGeWpjU24yTTFiOFV5WnlxdXZsUG5qQVlmNXpOQVN0MmtiZG5OVHdu?=
 =?utf-8?B?MktHQkNMeVNsYXd3S04xTDVZMm0zNms3SmZGWWttenRMdUh5ZE9hRFV1MUh5?=
 =?utf-8?B?dkQvemFvY3Q4TnFocS9ZaUs5L09LTmhkRkFtb1BnOHE0RUdiT3hRaVE5UHR4?=
 =?utf-8?B?ZGk0TSs4cHhUQVo5YjB5NTBBakU2VVdpLzFCSWY5WS9rdzY3Vk1QdktIcllX?=
 =?utf-8?B?UWJhTE9ONWlCMm83aFRNVk5PYS92c1ZHYnBsclkxYVhCU3NJbUU3emsyK2pH?=
 =?utf-8?B?bFZHM1l2TSt6N1B5eis3RkQwUWFvRE9WUU90OWdmZEVXY0pOWnIvWUh1b050?=
 =?utf-8?B?dUVFWk5hQVhhSTc5c0lnQnhqNmlJZlJ4ZU9uZHZsZEZFZVpDMG9XazhRbG9M?=
 =?utf-8?B?d2Fkc0dlMDJ0UDRxZ0l5VUpEMExhZTIyaVNuazRYWTFtK2RvOHRTL3RkdXBr?=
 =?utf-8?B?RFNTMkRNSGNEZ2xYUW5JeDlwd0wzZUFuTVRlZ0JZb0cxcFpjMkdDaTdHMkp1?=
 =?utf-8?B?RWhibUFrRDRRYzIrREtqaHJGTUowaXFCVm5YQTVTSldTY3FzbDBWOVlvN3VS?=
 =?utf-8?B?NVhVdUNtWXNDRGlBdWxYU0M5dzNLM2N4dCtDUk1uSncxbXhHeXB5MW01bUlP?=
 =?utf-8?B?b2hweHpkYWVaQ3VHRTA3R0ZFNTVDSFpDQmFTUzNpakFPejJya1prU2xXYnhH?=
 =?utf-8?B?ZzBoMURlMWxGQUtVWjBIU3g3Q3ByejJtVlN3ejA1bVhlVDBFelJsTk5nUExZ?=
 =?utf-8?B?b1pRcHVpcHZIeTFIM0Vzb3JpNWRNR2d1T2kwOHpDcjk3NzU3aytyN0RYcjI4?=
 =?utf-8?B?VTRiL0pUcTFhRmJ3cUhPMkdjR1FUUFhIRkhHc2VEOElHMm54L2xNTVJ2a2xL?=
 =?utf-8?B?a3BnMkF1ZzU0bFVuUTdJSDIzbHh4d1R2cllVS3FpZXpCSE8zamp6SS9yb3Fp?=
 =?utf-8?B?RzlQSHI1RWVxd241SkcxKy9VZisxT2l1dW9xU0EvTUhPY1lIYm1MM0sveXBC?=
 =?utf-8?B?eEZ1aCs1SVZ2djA5cmJ6N1haWUUxZDhiSjFtdDBDcXJRMzI5bWNBSit5QjR2?=
 =?utf-8?B?RE5yQ1E4ak5JT2RSL2pvNTgwVmJ1VCs2bHB6ZGZ5RVJxVTVzR0JiWXJCaFRa?=
 =?utf-8?B?OVBYUWJWcGNkN1o0Y2dGTWxSZUVwS3RRSURzZmk0WkthS3IrdFA1Y1ZLanNT?=
 =?utf-8?B?b245bGxPVWxJZERtMG05WEFTZS9HdElkR3pqVmxZZktybjJ6bWNlNThnK1hh?=
 =?utf-8?B?WkMyV21OcXJKd2FrUk5sdzh2SWxqbHNaZEliRXM1VExsWjNJcjlxK2x3NWZ3?=
 =?utf-8?B?NjNTemJxSU9lL1FmMThGQkI4VDc1SGYyREo0RzJ2WUhaNVRSMDIvQ1lqRW5m?=
 =?utf-8?B?OWtkcjd6NjhEeUMycXM5WUVWT3FKT2RTOU1iUFJ2ZUJ5bUYwUjhpcVQ4WXd6?=
 =?utf-8?Q?47GI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e787cf46-6922-4bfb-cbb1-08d9f0ebf6a4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5149.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 01:30:50.9687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: waIAADEHvv6B3V+ClfUwJalpPuDWo8ZhNxvjZ8w7HfKxCGJvFtVL/iMpVj6W2/eu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5764
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
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022-02-15 7:38 p.m., Felix Kuehling
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20220216003841.1419615-1-Felix.Kuehling@amd.com">
      <pre class="moz-quote-pre" wrap="">Reference:
<a class="moz-txt-link-freetext" href="https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays">https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays</a>

CC: Changcheng Deng <a class="moz-txt-link-rfc2396E" href="mailto:deng.changcheng@zte.com.cn">&lt;deng.changcheng@zte.com.cn&gt;</a>
Signed-off-by: Felix Kuehling <a class="moz-txt-link-rfc2396E" href="mailto:Felix.Kuehling@amd.com">&lt;Felix.Kuehling@amd.com&gt;</a></pre>
    </blockquote>
    Reviewed-by: Philip Yang <a class="moz-txt-link-rfc2396E" href="mailto:Philip.Yang@amd.com">&lt;Philip.Yang@amd.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20220216003841.1419615-1-Felix.Kuehling@amd.com">
      <pre class="moz-quote-pre" wrap="">
---
 include/uapi/linux/kfd_ioctl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
index 6e4268f5e482..baec5a41de3e 100644
--- a/include/uapi/linux/kfd_ioctl.h
+++ b/include/uapi/linux/kfd_ioctl.h
@@ -673,7 +673,7 @@ struct kfd_ioctl_svm_args {
 	__u32 op;
 	__u32 nattr;
 	/* Variable length array of attributes */
-	struct kfd_ioctl_svm_attribute attrs[0];
+	struct kfd_ioctl_svm_attribute attrs[];
 };
 
 /**
</pre>
    </blockquote>
  </body>
</html>
