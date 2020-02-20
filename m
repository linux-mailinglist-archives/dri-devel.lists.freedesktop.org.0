Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAF9167BD1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9E16F41A;
	Fri, 21 Feb 2020 11:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2041.outbound.protection.outlook.com [40.107.20.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C9C6ED71
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 12:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fdI8E9M/8LxsrD/pqmMlO6OOOcXJUgchX3jyYJNHo4=;
 b=Dph3o5HRJKO2qhC6TxqusyegHANo1uO8t9IiRAsBgO+PWhlvSUq1YuC4ObIz/9s/fSVUJbTZ/aMKk4dJdc6tULVA18HNNxg6bjKIczyYDkysr1sYbgf7ApqLN3C/6AGEAsGZDEk1dOTj8IUfSDrf9s71QwiG6GgStz0HGiNDmTw=
Received: from AM6PR08CA0012.eurprd08.prod.outlook.com (2603:10a6:20b:b2::24)
 by AM6PR08MB5109.eurprd08.prod.outlook.com (2603:10a6:20b:ec::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.27; Thu, 20 Feb
 2020 12:44:26 +0000
Received: from DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::200) by AM6PR08CA0012.outlook.office365.com
 (2603:10a6:20b:b2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend
 Transport; Thu, 20 Feb 2020 12:44:26 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT020.mail.protection.outlook.com (10.152.20.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.17 via Frontend Transport; Thu, 20 Feb 2020 12:44:26 +0000
Received: ("Tessian outbound 0420f1404d58:v42");
 Thu, 20 Feb 2020 12:44:26 +0000
X-CR-MTA-TID: 64aa7808
Received: from 478f82cbb795.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 196E8736-5649-481B-B1B8-54B08EFD4355.1; 
 Thu, 20 Feb 2020 12:44:21 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 478f82cbb795.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Feb 2020 12:44:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6lGuD9VnJVkJ8AbYtTpkH+6wETF5kmUdSvIQJymzMu5/37c4t/P3I4LAEXI6Oy0jFz1W3LKbvg2oL05HO1S0zS7KL6y4gWNm6rSsX3Rnasi/y/MCLP5B6M5JVNpwPONWQx8UVLt9G8l34+vsE4IBsQdbze4gyAvINUjNuYhjaHZZYXXGmfF5QpbnRYmQ8wgJdGbVADuaFDEPNI3WXq8zLUuHMvEgjG9I7DKRWnXuk8qAEQDSgL1AEuOAUopIR7b2CIBHwARp5K8uQOAMiiS30xuVSNrH0zK67ZThT5Y9fsy5WcCsOHWSD/CC495vwk1J2nbHthkTYfvIjsnf/YeHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fdI8E9M/8LxsrD/pqmMlO6OOOcXJUgchX3jyYJNHo4=;
 b=S9UiLLfNeHUEKChpXcRkdXdW+FVLYxl1OGl/I92u6mUBKwPcsQIaG6l5Ed9tcQl6A4oLErBFdr//nwAaFQA7K3fkVrjgH6beMOfYKuc/i6we9V35nLQJ5EXPq1kRVZXCnGjmgiyP9iXPX0O11ZpqDcyHGFZEkLXpO+QdBbZGTKYDcdRDqqVJXo0cLsxEgD8a++XkfOCvTjLpyYSKGO3/j8jxvPSTiZ9CxRCZU8lzhvnAyKq+FRNk+MyCXB/DGcUoMQK07O0QXerHWYKamDoR8Buan6TVtJP+H1nfvbSrT5KBAlzmWJ7ze1GuWGV5N7Cm1yxSKoTj/l3ED3YtZgX4Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fdI8E9M/8LxsrD/pqmMlO6OOOcXJUgchX3jyYJNHo4=;
 b=Dph3o5HRJKO2qhC6TxqusyegHANo1uO8t9IiRAsBgO+PWhlvSUq1YuC4ObIz/9s/fSVUJbTZ/aMKk4dJdc6tULVA18HNNxg6bjKIczyYDkysr1sYbgf7ApqLN3C/6AGEAsGZDEk1dOTj8IUfSDrf9s71QwiG6GgStz0HGiNDmTw=
Received: from VI1PR0802MB2237.eurprd08.prod.outlook.com (10.172.12.145) by
 VI1PR0802MB2336.eurprd08.prod.outlook.com (10.172.12.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Thu, 20 Feb 2020 12:44:19 +0000
Received: from VI1PR0802MB2237.eurprd08.prod.outlook.com
 ([fe80::74dc:6713:1819:a113]) by VI1PR0802MB2237.eurprd08.prod.outlook.com
 ([fe80::74dc:6713:1819:a113%9]) with mapi id 15.20.2729.033; Thu, 20 Feb 2020
 12:44:19 +0000
From: Guillaume Gardet <Guillaume.Gardet@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [Bug] virtio-gpu broken with qemu/kvm on arm64 on kernel 5.5+
Thread-Topic: [Bug] virtio-gpu broken with qemu/kvm on arm64 on kernel 5.5+
Thread-Index: AdXn61yFYQwTcGDvSs6HxocaeVOz6g==
Date: Thu, 20 Feb 2020 12:44:19 +0000
Message-ID: <VI1PR0802MB22374AD8B80182D2F186ABB483130@VI1PR0802MB2237.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 7169bfcb-5ac1-4423-a465-f2f3c0f086da.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Guillaume.Gardet@arm.com; 
x-originating-ip: [2a01:e0a:d7:1620:6cc4:4c93:7c07:b997]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 058033ae-5969-497e-7c22-08d7b6029ea6
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2336:|VI1PR0802MB2336:|AM6PR08MB5109:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB510968A30F24E70E40423A2283130@AM6PR08MB5109.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:849;OLM:849;
x-forefront-prvs: 031996B7EF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(346002)(366004)(39860400002)(189003)(199004)(8676002)(81166006)(81156014)(66446008)(71200400001)(66556008)(64756008)(8936002)(66476007)(4326008)(2906002)(86362001)(5660300002)(52536014)(6916009)(966005)(66946007)(7696005)(478600001)(33656002)(76116006)(6506007)(316002)(186003)(54906003)(55016002)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2336;
 H:VI1PR0802MB2237.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: p8huDnYcnZD9DShA2Ld0POTEX48222jU8Pu9ZxkQ/WYiMFCijZBF3b12SBlVi+BknsZMBCl2jhUZ1MQVaYl+9dIh8dIUr+mF1s8xceHFKkFy96b3e1d98+ikB7zpZR1lIiqXwSW19Howwo5dyzYpKmoS6YgmcJuYgxo16ExN51ZamRex+YsUG+fi3134x7Yca9OiF3GJYEIgGxCkf8pBL8sgC2zZOGtaB11BGzcysFsjVYXKW9uVE0JPkhCck1uV2AY87dRZelgouZhK2k7YaIR93KG8JChdmjwdf88my+w85XIt7vjNpP4X26dqDIi+YUIO7MX4NlTHlLarzgTBTsdKgR3zG0l0qEnJ1i7ZJryBG2p0JI6LgveG3CGRAk3vfzrGoD5RLXKZPSdUuwuEcOSN+/u0O+OfHYaokkJzYoEzYaPJOq6M1g0jW7jZaN3T2QkW5dTCYbKP0Sbu8or5NFzUbdtFEL3AU87LaoROUFLppigGrE+vj2W2k5ALBomZi5di1RUVKB6NKn6sr14tIg==
x-ms-exchange-antispam-messagedata: 50HASFOaE5P1fKeUCc+gItHu8CRuFRbmTHQrTxZ2IlWSpbzskH05e7anm86oBRfIeeur7pp5rzEbNPWqSL+c7jkTFwwCFTFNKD3ZuSlPDDRle29+LHuJFdsh1cxWWv76+jcqMzF7cd5SqiBGABMBJoIWPzOWyC6DbQt2f7n1bD4cgTUvfUdoK9bhwcHxIDykQ08Tlhp93wTwlP4rKRPmpw==
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2336
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Guillaume.Gardet@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(346002)(199004)(189003)(55016002)(9686003)(52536014)(6506007)(26005)(54906003)(478600001)(966005)(26826003)(8676002)(4326008)(186003)(81166006)(81156014)(6916009)(33656002)(86362001)(316002)(70586007)(5660300002)(336012)(8936002)(2906002)(7696005)(356004)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB5109;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: ac6be015-0370-4636-41ae-08d7b6029ab5
X-Forefront-PRVS: 031996B7EF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WD/II9rAg4avFrOFgaOf+3sDF7QsgofWLFHhjSnn9RJXLIf9nVpPFa2d+BcHjP4/KQq7OZFhJbV5iyR32qeIMzZl0cpgPBoBoqMku5taNOKguE1hlgXn9AdlPPDYnf5k9aAk+pU8YAtlzcWsZlVmqb9CAJlfrvRAzjerLPIyacj3nI2quIYxc4bX7HKid0MahawR3HcHhdVhnnx/rL23WjogbZcdZj5EgUgFg1hOrVJY5OlIQqcf+7cN00fkdz2Cgl1kWqQDngFRY/Gx7Uvq3DOyCyVJot8M3+OOmLCP41Owv0N9ZPJAdEu4S3YZBz83snr4tDCnUQsSgr2shIbIkOTBUt3O/5aKUVqxJFZtfv4SlPqItN8itg6T+BJjh1/lIZ185OB/RAqPGWOqeNv4lLKGglHA+HZgTl2YrSZ9aU/DRyjP73d1jaUWKl8lFx3VoHRa62Z74zJ/uLFk0ljUWAzFjUDT2+WFb053cm0NE+/SueRUTQSvTCr8iU6o/y2EDGJ3CxcRnyh8dnoaVfdX5g==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2020 12:44:26.4045 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 058033ae-5969-497e-7c22-08d7b6029ea6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5109
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:23 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, nd <nd@arm.com>,
 Catalin Marinas <Catalin.Marinas@arm.com>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

With (guest) kernel 5.5+ with qemu/kvm on arm64, I get lots of display corruptions leading to this kind of screen:
https://openqa.opensuse.org/tests/1174521#step/yast2_i/24

I git bisected it to commit c66df701e783bc666593e6e665f13670760883ee
**********
drm/virtio: switch from ttm to gem shmem helpers

  virtio-gpu basically needs a sg_table for the bo, to tell the host where
  the backing pages for the object are.  So the gem shmem helpers are a
  perfect fit.  Some drm_gem_object_funcs need thin wrappers to update the
  host state, but otherwise the helpers handle everything just fine.
  
  Once the fencing was sorted the switch was surprisingly easy and for the
  most part just removing the ttm code.
  
  v4: fix drm_gem_object_funcs name.
  
  Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
  Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
  Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
  Link: http://patchwork.freedesktop.org/patch/msgid/20190829103301.3539-15-kraxel@redhat.com
**********

I also tested kernel 5.6-rc2 which has the same bug.
Without kvm, the display is fine.

Regards,
Guillaume

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
