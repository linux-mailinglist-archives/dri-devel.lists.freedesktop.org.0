Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4C124CE9E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 09:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1236EAAA;
	Fri, 21 Aug 2020 07:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2095.outbound.protection.outlook.com [40.107.220.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B437B6EA69
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 21:17:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8uPmNXfKbB13E6yD9JawgdvfzGMgs/moQSN0J9VKHS8piDUS/i3uYr+FtsvvhQmy6ybdnQnmpDyqdLsFOQKai5WfY8D6BsUiZyYrPmZT9KV1q0Pa4OX76CRnvURAq9E3jEfon8jlfJqxRqp5Gdebq60Gf2nbMqSagcQL1pyrQizCc4yKz9f/geErBio+xormRvowdgxoF8ef2lrS9yRHPcTUSoh93mscBCJCPYy+uwE2JKdMpdzf2XYJp6Y8YdQw6p+Go3SE1M4FboikUPkneg1hXTSOxTm8vCQICP27M+y2ClgrgYo7517nzfuTOzbcBu0oZ7ZMkMWHEwqrZkkZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqN+mbbQipXMazByDPmrBQ/Z+uxRLOMU5aLZtrjLgLE=;
 b=UpSZbt77Q8by/5Q+dpCR0JfZqRqf9RxyXVs8xAOMiSfu2fsCGLhfl3HZYwYSWoEKLPd1taVAMdH8Se0b0SxphvwR/xryCxK3AtnRPGt5xMxUU1XNJshHHq9HV0T9uz+S3z3nETQclS5biJYcEsA2F0fg59KPANXz50KZ2uQ3pOP2PoPd1CUAw4AX5TcUE3FbGPSu6XJa8LJyCdna2w0w3bxxhq6gFKoYDOk9dhkC7BtHjrhmng5VV04o6FV62RgikhbEut3fb4yoL3v9w6tC2UfgnJV3eFcAlKiVmC67jiTqgwnq3UbuF8pKIM2nyvCFO7u47MhBb9ca5YjvY8GpsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=designlinxhs.com; dmarc=pass action=none
 header.from=designlinxhs.com; dkim=pass header.d=designlinxhs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=designlinxhs.onmicrosoft.com; s=selector2-designlinxhs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqN+mbbQipXMazByDPmrBQ/Z+uxRLOMU5aLZtrjLgLE=;
 b=drT8tqoRiOVb2Opov73n1oGubNHtZl8QakyN6/YU6Q955FQGr3+gaU6sckFeSId5P88V37XpfEJ2SCVe3SYzhXxLM98Wbs2MbiWvFxCAlIfwINVtqu/oKUdFHzAbZ8qiPgPBoj7rFJq2Eaj6W9JoLFn04vmXnEChh0o+/DmF/lE=
Received: from BN8PR17MB3025.namprd17.prod.outlook.com (2603:10b6:408:5c::32)
 by BN8PR17MB3010.namprd17.prod.outlook.com (2603:10b6:408:52::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Thu, 20 Aug
 2020 21:17:46 +0000
Received: from BN8PR17MB3025.namprd17.prod.outlook.com
 ([fe80::3097:62c1:5903:f3f]) by BN8PR17MB3025.namprd17.prod.outlook.com
 ([fe80::3097:62c1:5903:f3f%6]) with mapi id 15.20.3305.024; Thu, 20 Aug 2020
 21:17:46 +0000
From: Kenneth Sloat <ksloat@designlinxhs.com>
To: "hyun.kwon@xilinx.com" <hyun.kwon@xilinx.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: dt-bindings: display: xlnx: mixer: Inconsistent pixel format
 terminology in dt docs
Thread-Topic: dt-bindings: display: xlnx: mixer: Inconsistent pixel format
 terminology in dt docs
Thread-Index: AQHWdzdZDHMJ4RCJPEqeVWmACT1c3Q==
Date: Thu, 20 Aug 2020 21:17:46 +0000
Message-ID: <1ac0eeed-7455-b0a3-a3e4-4501ae3129df@designlinxhs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none
 header.from=designlinxhs.com;
x-originating-ip: [47.196.189.188]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3fe832e4-f9fd-4dd0-7530-08d8454e7c22
x-ms-traffictypediagnostic: BN8PR17MB3010:
x-microsoft-antispam-prvs: <BN8PR17MB30106F0BEE167800F391B40CA15A0@BN8PR17MB3010.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cD5eZmLkjRe7hO+ex9b8FsFdRw3DRTprbpjfwSxc7hfh0MgnhsS8ZDUPlkHsqm8qk38srV1taFOPcM5tvB4n+VMsmdNCMSdQv0/5yA+DmDxQRwhueni4kHTsDpI4TJrt82twumzNcnb1N4WkGezkZUyaI65qUFxIKnpILdmzAy2zVm46ckVCytP2NjpVcwlJUkqRCJSh8bCVyxHPNoEu/fQx+yLA1/GScfpyLiCLjiDkOOw7QiO8FyEFddKaRrnWGfGcKp2QJmWfZVUmM7qFLkx3PAF2AyJAJ1CKhG/FjVTBGiiOwncZoycrK9/T9RkVN2OFuqwo84tGYpRLgE+8cA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR17MB3025.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(39830400003)(136003)(346002)(396003)(316002)(6506007)(110136005)(5660300002)(91956017)(76116006)(83380400001)(2906002)(86362001)(6486002)(6512007)(2616005)(54906003)(4326008)(478600001)(66946007)(8936002)(66476007)(31696002)(64756008)(36756003)(66556008)(31686004)(8676002)(71200400001)(186003)(26005)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 09xG/wpQ8sA4lJLmrdTBrro3YsgHNL67lL41EUKJzk49dwfk51GWdWrhpxqw3qhvJjKw+0iTvtrS+ANurMxsnGPBP66hQkAoBjTwzuQwCRwScNt64t5KcI1hcz6EgqABr/oa3TlyDd9aMwAgkEA/xBQOuSiOG1a2c1RPWT5xSe+PyGQM2zj7Td9ZwRLrlPsCtMrLldWB4EtdKNgZpgSFgqAVJ+6Y/+xgCxwO2uBzc6BtLEJgKEeAQk8j79yUId3BPUBZHVr55O1RoBOBVoL37C42tUHZiSZ9XeyFyyOmpX1Mv+kH2PzZxnn0mGyc29w2uU+x7JpRBXDKZhjj6P8xnAJo6NdBdZBhv66gBxooaYCB8Dq4aJwQfg7Bw6ZUQZQtYRGD8P0Ce/W9DIIsioS7mhdqQkQady9DaWEr8vX+3pyunyS5udlWFbmbUC4vVIaaCdVEkTUVppOb8Mh8zX+nFB5QX8cy8rxI7TSre3WAnYpkKmRERcRet40HdSZ69WTyrN+qWAMjygJrtkeOYGs7cBKf3l17WGsE42o5fL0t1hsHrz2o+BKS3YrViJXsarJoZBVoUWMqJ4iglze0WIIcNHMXHwqHNe+rL3Hjj3VF2U+c+526NgB18Bk1GDZ3DPBTJra8y12B7p96xyypb0E3YQ==
x-ms-exchange-transport-forked: True
Content-ID: <ABC86728DF772D41AA24E46B429ED2FE@namprd17.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: designlinxhs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR17MB3025.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe832e4-f9fd-4dd0-7530-08d8454e7c22
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2020 21:17:46.3524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 21db78a4-85a8-43a2-9030-593b170ddfa9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kVbzI+sdn38FD60FKXWMXE3YP61hPT3jiJvQ7dPmvpHspm0GpnZJSM947eogK7c+DtRgoy7z0cw/jPJIIGmtIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR17MB3010
X-Mailman-Approved-At: Fri, 21 Aug 2020 07:11:07 +0000
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

The Xilinx Video mixer IP uses the DRM fourcc string as a device tree binding in order to describe the format for a specific DRM layer/plane. Currently, in the device tree doc in "Documentation/devicetree/bindings/dma/xilinx/xilinx_frmbuf.txt" there is a list called "VIDEO FORMATS" with a table containing "Mixer IP Format" and associated "Driver supported Format String" (fourcc). In general, this table is not helpful, because "Mixer IP Format" does not match the Xilinx IP datasheet terminology for formats but rather some other commonly used nomenclature. This is also inconsistent from other Xilinx dts binding docs which specify the actual correct IP name and at times list other format nomenclature where helpful (i.e. xilinx_frmbuf.txt)

My suggestion is to remove the current "Mixer IP Format" strings in the doc and replace them with the actual IP names in the datasheet (which also match those used in Xilinx's Vivado FPGA tool). Otherwise, the programmer must cross reference other dts documentation or the code in order to figure these out. I am happy to provide a patch for this but wanted to throw out the suggestion first.

Thanks

Sincerely,
Ken Sloat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
