Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7218326A034
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 09:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1216E21B;
	Tue, 15 Sep 2020 07:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760079.outbound.protection.outlook.com [40.107.76.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB926E21B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 07:53:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2Ixk/aPehEN7lh/S6yKNSHfZhHaNuwneIFKR3naZkaIe4JTFR9aQZ4l/Pef4bhYedDkPvcm08/ussBktiN3bgvCJOYToFTJGwX0iV32y/I+7/vi/X+k5yIHfcd4n/2jkKUePhXxSKtEDnfH6Wrtn+Qz6b4YymJlJODskjn8D0DUBeC+dWlI/w3YNUKNudO2qVnz3pD9aNQgYUd4WAjXuoyIpbTyJhxzF5TAcq0vWvALKmb2+yFkZWwk0ghOAbQsY3wHIprQNpLI1twcmcIRAEvqsjOzDlm34dswk2ejUThpBJAp6tAGVs6bnr5Rxk4wkP9Y6u5IC2SbqETzeKgGcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWExTE6HqpY7JMT9s73LFNehxiPJBM0JCqK3A+onrNo=;
 b=MzZ/CbiBFo3IKeCqd2ad2VhhNB3/d8R2MgJvJ8kLhYeIRtUDuDLQu8YVqZdEE6BRt+V44m+JOaDvn72u53I6uyZe26mcrO4c0XwWsyHQ1YZXUpsaj55NhMRE4wdEzZnP0Rl3jBOtNeGO/VGZLlTxF3+GKKYbKJeuCdTS5a+5hpkOWMQ+W8K/oaA89nD3LvZy0uphbQMnQ50yiPTMzFzP/F0xm4wxBFzRgTfteWWNZ0EfwTCM2Tj1nfZxe/igbgHWExZxSOOytkunJMTh0VD4voOU8UWVXRAjDrmab0skfUkAyepJBNwUgV9U7GB6eqvER3T2+C8mbHO2izxfMFgVgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWExTE6HqpY7JMT9s73LFNehxiPJBM0JCqK3A+onrNo=;
 b=fqCeya3pjLxiuFWZIA30sKHLQWojZtdjrf8L296OuuN90fYZXyZcKRBSg185nf7nsMAeCVUrFXZbOBZ5TE1kQjLoco013ubu4jn7j9IQA5gn4PZiUwiu5qFCoe5KkEu/DeMNy/SNfA8YwC1rEKuJUmt3W0LGE4FLE+cKpB0E+Lg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4992.namprd12.prod.outlook.com (2603:10b6:208:3c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 15 Sep
 2020 07:53:46 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 07:53:46 +0000
Subject: Re:
To: dri-devel@lists.freedesktop.org
References: <20200915024007.67163-1-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b8f4ae57-ccfb-4cd2-d7a2-3778bc07b724@amd.com>
Date: Tue, 15 Sep 2020 09:53:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200915024007.67163-1-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0078.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::31) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0078.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Tue, 15 Sep 2020 07:53:45 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2ef88fd2-0734-431a-0d50-08d8594c793a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4992:
X-Microsoft-Antispam-PRVS: <MN2PR12MB499244508AD4B2226537A26283200@MN2PR12MB4992.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PrgTe1nR32f9xOqkOcz6YNfJ1sLFwzBtQTKOfgxGSzaG4Cdob2dr4SgQ+1OTs4CY/LFHFinkFtXwwSU6LbmJFc/zEtMnPlWBtORCO4gt3mk3KzhITTc7xIg/StjrHImqWtK4kix5nvJsuRQ0G2AjSet7PAKj9Y9zUs9UEKmkeznbknRudXWYyoX8wuV4XWSX8FWRdVnI6hmWuoomRMPt9FswFpPE/BhW41fu/ondCAhQRY+KR7+zheGAGZmmlgcZd2QBLIw+snixP34Zg5n6myBjIygoyp3E6jqs736IZhxKW+qXCQl+wfVNN0DJLDG7lI/C5zeTjTuRjgFLdwyfudqKIlKDfxmecGcYR6Tg0WwlGYVQQNcEP9Vo9ktGxht/Y8lDJUa6Rv8DzZvt3KFQPX9JOyu8Rm/IsOMnocM/nGU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(8936002)(6916009)(66556008)(2616005)(66946007)(66476007)(6486002)(31686004)(4326008)(4744005)(3480700007)(16526019)(186003)(8676002)(52116002)(5660300002)(316002)(2906002)(6666004)(478600001)(7116003)(31696002)(86362001)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: H9RLj5PTXgmLB3ukYQymAxP1NQfEdqGe5yd2uQ4V/ANCtiG3o/MZ+lMGEafNqY4efwZ+FNXPCoINwsKz7yCnKN302wrnzFIUMmg1vWD1f0eUZBplBHZk9sEQ+cZ3ho+yBtpxGb6BTJV1eS6rHGCf6bFXWkCLoOOtWC58Eti1YJVnQOfI5Z/036dtITW4RKQjeGVt8VIRqi2P1xZrHTouzOZUsx0wE+/LkFtgaEOEX6VuZBgHvtkGOgeEbsFX+3hiIs46HDMCB/jjMEVWsZKAQdz1oolbRYw+kEfo4i5AW5sGJcy/Pv6AhlO0bJzIecL8HdxfIeFgKkc2uzVRTDe7/PZUfGcb8dKPWp/NGXUOgidp4qGT8b8uigBcbVubrKMFEkTbxVg3fOvunozQlUQgeCwn22YbHCFJst3KKllia3wH5zA+dX4rkEx0zJFA/hxkXr5AqqTCpUOKVDLbdXTktjgS2L9h6jbQSfE+/1InNOlW3goHuSkm1eciSco0GU/LR9FpYLJm6IEV8Nll5njM14lMLsQi6qsNdJQPymXHTRdNaOScTMLzzi5o843L659h3hwjSD1TSLjw6ahh3/cMMpS5CWdtbVpz1FmccrBY8rUYtjhR0U0qSsq1My/nIMxXYlWdT0SMlzEIaetzDMqd5ogHNraBk5ViqSa1NAMrha7PNE7mrlBsUQ9WhiJEjZYxtlKRcg11qIfIj6flkHfzQw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ef88fd2-0734-431a-0d50-08d8594c793a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 07:53:46.4006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pa+8z0kVuhXDWp3vyvD78H9jdpw7OHfG22r73dyi4x5/FX4xLY92gYsSl5+eL/lt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4992
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
Cc: bskeggs@redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Christian K=F6nig <christian.koenig@amd.com> for patches #1, =

#3 and #5-#7.

Minor comments on the other two.

Christian.

Am 15.09.20 um 04:40 schrieb Dave Airlie:
> The goal here is to make the ttm_tt object just represent a
> memory backing store, and now whether the store is bound to a
> global translation table. It moves binding up to the bo level.
>
> There's a lot more work on removing the global TT from the core
> of TTM, but this seems like a good start.
>
> Dave.
>
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
