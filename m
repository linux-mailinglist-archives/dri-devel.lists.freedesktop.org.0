Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4791704DC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 17:52:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8458F6EAF0;
	Wed, 26 Feb 2020 16:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2077.outbound.protection.outlook.com [40.107.22.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B226EAF0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 16:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVFCcWr81WE+q2KcA8/+WNlRjoHnIwilTf681ccn85k=;
 b=zERmq0yiFPMC0wGIHj7FQ5EozMRNNTcC6J+2HWVqd2s+tttnm8dH1ZipUPG7Pz07PLKdwQ5KgUYX9SjyFMP04OOnoJQzT2gVdCW1Q67nuRLqsUjfyFTT4DiyuIQCl2XVLlKQLnmImyn4pDXLplaZqsf2qit0qr5eyHd+B1wzsN0=
Received: from HE1PR08CA0061.eurprd08.prod.outlook.com (2603:10a6:7:2a::32) by
 VI1PR08MB3504.eurprd08.prod.outlook.com (2603:10a6:803:84::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.21; Wed, 26 Feb 2020 16:52:29 +0000
Received: from DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::205) by HE1PR08CA0061.outlook.office365.com
 (2603:10a6:7:2a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14 via Frontend
 Transport; Wed, 26 Feb 2020 16:52:28 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT015.mail.protection.outlook.com (10.152.20.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.15 via Frontend Transport; Wed, 26 Feb 2020 16:52:28 +0000
Received: ("Tessian outbound d1ceabc7047e:v42");
 Wed, 26 Feb 2020 16:52:28 +0000
X-CR-MTA-TID: 64aa7808
Received: from 9d48de8ce8f9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 40EFE063-870A-4123-9DD0-72D59141AA39.1; 
 Wed, 26 Feb 2020 16:52:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9d48de8ce8f9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Feb 2020 16:52:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAso1H5H7HxKIWoywEhZioyDIBOVkOaX58qhBZEHrWNyjyTK+3NX8EGvvmXjgaOpwPFa4JY1bhn2SwQ+Kcn79XUU5fw4WNP+E/+o+h4quxHKAc7O6RpjDPKPmEGGYswKis1xVnPyTLnjzS+8u3y70xMk6Cyk/o7ixw85x7nUnC9TNQhanwXYbCq8tp1gn8KOnWyHMAUyIuXa3l31Vo8mSHSOATSdtA/jI7lsZR2uvEnnQSAOJPyuGj3y8yoCoZK4/OhP6tOSgejpp+hVwSOZKNwKQf/zTo9ek999uiSOGswaPKpMIfCXUrHLLRSchh6xzEDqtn23YdXijyGM26Lw8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVFCcWr81WE+q2KcA8/+WNlRjoHnIwilTf681ccn85k=;
 b=a9UUee2tnufim+WHqOgyzBNrzsE84zf0dHf0nzsRtlWeFw4cLU6dTYFgJ7bonNcjTmYW+wbgh81OvRo6P6PRSMrsYsYfri28Mcmgb8KTy8vDGxa+zMz5melOiEY850pT3ODvlP26Kt7lqDBQlHXCysBX/EJFKAfYE734AMjPY+Vb/yUU5yO5Evqwgmb66QoM1z52WJakkLb6a4V9wsIZcLvJG1uVKW6v0339YmsgZ4NqOSc6OpEE0AcqiG0wl/Fr0Ax9cp+Z85OntjHC/JbPGD5jtqKl4Mx/KcOf34tb2QiiCpzxuVU51R1cAumYPLBlrGPW9M8g3Ln3SjV9rfb3tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVFCcWr81WE+q2KcA8/+WNlRjoHnIwilTf681ccn85k=;
 b=zERmq0yiFPMC0wGIHj7FQ5EozMRNNTcC6J+2HWVqd2s+tttnm8dH1ZipUPG7Pz07PLKdwQ5KgUYX9SjyFMP04OOnoJQzT2gVdCW1Q67nuRLqsUjfyFTT4DiyuIQCl2XVLlKQLnmImyn4pDXLplaZqsf2qit0qr5eyHd+B1wzsN0=
Received: from VI1PR0802MB2237.eurprd08.prod.outlook.com (10.172.12.145) by
 VI1PR0802MB2575.eurprd08.prod.outlook.com (10.172.255.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14; Wed, 26 Feb 2020 16:52:22 +0000
Received: from VI1PR0802MB2237.eurprd08.prod.outlook.com
 ([fe80::74dc:6713:1819:a113]) by VI1PR0802MB2237.eurprd08.prod.outlook.com
 ([fe80::74dc:6713:1819:a113%9]) with mapi id 15.20.2750.021; Wed, 26 Feb 2020
 16:52:22 +0000
From: Guillaume Gardet <Guillaume.Gardet@arm.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v5 2/3] drm/virtio: fix mmap page attributes
Thread-Topic: [PATCH v5 2/3] drm/virtio: fix mmap page attributes
Thread-Index: AQHV7LwkjpLu2iQNSEaItPZROfIBIKgtsI6A
Date: Wed, 26 Feb 2020 16:52:22 +0000
Message-ID: <VI1PR0802MB223736CC0A877F9219E8B86383EA0@VI1PR0802MB2237.eurprd08.prod.outlook.com>
References: <20200226154752.24328-1-kraxel@redhat.com>
 <20200226154752.24328-3-kraxel@redhat.com>
In-Reply-To: <20200226154752.24328-3-kraxel@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 07625185-7287-4dd6-bc71-b5ebb70d91a9.1
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Guillaume.Gardet@arm.com; 
x-originating-ip: [2a01:e0a:d7:1620:d09c:e29d:cc48:6fa]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1fa569eb-99f2-43b6-528b-08d7badc439c
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2575:|VI1PR08MB3504:
X-Microsoft-Antispam-PRVS: <VI1PR08MB3504068E8D534D872E82D75F83EA0@VI1PR08MB3504.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:421;OLM:9508;
x-forefront-prvs: 0325F6C77B
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(199004)(189003)(186003)(86362001)(5660300002)(33656002)(2906002)(66446008)(478600001)(64756008)(76116006)(66476007)(66556008)(81166006)(81156014)(53546011)(8676002)(52536014)(66946007)(7696005)(6506007)(54906003)(110136005)(7416002)(9686003)(4326008)(8936002)(71200400001)(55016002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2575;
 H:VI1PR0802MB2237.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: H28jBxoVu8vCDf/BuNScEuqxN+RKU/4xgt9kPfo0ZrJNU86NiZ0sg3zmRV1y8F6oi6MKcHfwj5kjA4Q0RUiTwPs9ZFhTkZIp0sQRdmsKv4bkpEmapIZpw9EcF7s0lYGzViRhA0St5a+cWslptKlexAIE+ByVpsUx1Jg50I7/wRUvO5qm5rJz7K1KOhYcSe1oBbGRtG52Sg1qjGrjCOHwS4IgJEzkaP9RXM0K2fvSBpCqMotaZrfbTtXuDbez+HCN85xRaG942cmnvdxv0/4T1Hafo2WNnHSKCujlN1d9R5jZotKPu+mGKREOK7QdaKfQY+vSbzJNXE3kylyZE/30JioakgndAx4oERvSGbX0Bo1KLm5WlZdFRIT7dD2pt33LKMEu/i6seFrGiesDlIatoZ0nA8LfDb+/tFPJ212zTatfDRu8dQEt40qR+4+REzwn
x-ms-exchange-antispam-messagedata: HGBmvvh0Xjd5fNJRZ/IpVIQqeUxql4gHnlScZ3uIcgNua+1QQH1UCOH+stYD0YKUXsTRkKHnX/h4SCFRdEEXUZx+z9Lr6ur7f9LvxDaJ+AqaSFEyXPB8nmYBCZ8wOsjhPLqxSdFRJXzg1TQ04+GzQqAT4G2wNYvczcbP/Oj0VTPfWhA3fv4p9Izt0/EiLfYaKg8N512d8gyHmH1MXMW/sA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2575
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guillaume.Gardet@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(136003)(376002)(39860400002)(189003)(199004)(54906003)(110136005)(5660300002)(186003)(70206006)(316002)(2906002)(26826003)(70586007)(336012)(478600001)(107886003)(4326008)(26005)(33656002)(7696005)(86362001)(9686003)(55016002)(53546011)(6506007)(81156014)(8676002)(356004)(52536014)(8936002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3504;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0691342b-d4f6-4e6b-d17c-08d7badc3fdc
X-Forefront-PRVS: 0325F6C77B
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FgZk5aooZPYv9SmRFHSKgGehmpyhgzEsTyaW4qxMywef5OOBiS6arnX6D8jSjwYYmCCxfAsFB9+0y3QE5ZikQ27SlR8xpmMJvSR76PtVfsW7N8Ne++pLw8yv1vbXt2nbn0Vo6UUT1f1ssfRrX2lO58lL+ZzATIp+3LUiKvXVOIjmmwRGWrm6pHRxNg5UdDYzR2cYvGaeJ4AcJJVMnXIwK/BzdzO6J3gQlSPOtQYe6oCQIxjNjPi0Gi+8nju2QpKzkYbYaFVZ1Lkvcn28FL7E+nxoDTfhyw96k+f1/m7uR8D4915eTmMI3ZXbhZqMw2OgjxIxPdLiFtaWNtH3oMmZxWJSnAYiHZINRDwXUtZBS6eEM4clNN9jgSE5QGUMoZGCTic5W+UVsGqv57a7/IYa/2Z3kqUIYT4z4yCuPEmfwIbBrKwk3AEZeKdlVgU+nP0A
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 16:52:28.5864 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa569eb-99f2-43b6-528b-08d7badc439c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3504
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "open list:VIRTIO
 GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Gerd Hoffmann <kraxel@redhat.com>
> Sent: 26 February 2020 16:48
> To: dri-devel@lists.freedesktop.org
> Cc: tzimmermann@suse.de; gurchetansingh@chromium.org; olvaffe@gmail.com;
> Guillaume Gardet <Guillaume.Gardet@arm.com>; Gerd Hoffmann
> <kraxel@redhat.com>; stable@vger.kernel.org; David Airlie <airlied@linux.ie>;
> Daniel Vetter <daniel.vetter@ffwll.ch>; open list:VIRTIO GPU DRIVER
> <virtualization@lists.linux-foundation.org>; open list <linux-
> kernel@vger.kernel.org>
> Subject: [PATCH v5 2/3] drm/virtio: fix mmap page attributes
>
> virtio-gpu uses cached mappings, set
> drm_gem_shmem_object.map_cached accordingly.
>
> Cc: stable@vger.kernel.org
> Fixes: c66df701e783 ("drm/virtio: switch from ttm to gem shmem helpers")
> Reported-by: Gurchetan Singh <gurchetansingh@chromium.org>
> Reported-by: Guillaume Gardet <Guillaume.Gardet@arm.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Tested-by: Guillaume Gardet <Guillaume.Gardet@arm.com>

> ---
>  drivers/gpu/drm/virtio/virtgpu_object.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c
> b/drivers/gpu/drm/virtio/virtgpu_object.c
> index 3d2a6d489bfc..59319435218f 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -119,6 +119,7 @@ struct drm_gem_object *virtio_gpu_create_object(struct
> drm_device *dev,
>  return NULL;
>
>  bo->base.base.funcs = &virtio_gpu_gem_funcs;
> +bo->base.map_cached = true;
>  return &bo->base.base;
>  }
>
> --
> 2.18.2

IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
