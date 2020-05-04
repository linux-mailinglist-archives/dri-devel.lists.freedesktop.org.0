Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 764111C34D8
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 10:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EA96E357;
	Mon,  4 May 2020 08:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30077.outbound.protection.outlook.com [40.107.3.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319B36E357
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 08:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ccOjH4U5ZLihVh8WAibZSAYYBO4ImtOs2UMnmc8KAcg=;
 b=Mb63dsVOylMgGDsEnJDGWmMzwArA5Ga7PKav3uakdea2pxbes1H24YpbtrvknRkA6Neam1wzLKooLDoAa8mMZhZDMybTPDYS4m334tnc6NazKPsGdZy5ufx6o6TGxPZn6LizakyrvbPgvr0X/V1mpVOfH45/ZBs5imbKV5cDitM=
Received: from DB6PR07CA0172.eurprd07.prod.outlook.com (2603:10a6:6:43::26) by
 DB8PR08MB4187.eurprd08.prod.outlook.com (2603:10a6:10:a5::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20; Mon, 4 May 2020 08:50:17 +0000
Received: from DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::63) by DB6PR07CA0172.outlook.office365.com
 (2603:10a6:6:43::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.17 via Frontend
 Transport; Mon, 4 May 2020 08:50:17 +0000
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
 15.20.2958.20 via Frontend Transport; Mon, 4 May 2020 08:50:17 +0000
Received: ("Tessian outbound ff098c684b24:v54");
 Mon, 04 May 2020 08:50:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 55b1d0c16200114a
X-CR-MTA-TID: 64aa7808
Received: from fe1fcf1b13ab.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6FC8B5AC-99D6-4982-9724-01A3C4E8A0F0.1; 
 Mon, 04 May 2020 08:50:12 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fe1fcf1b13ab.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 May 2020 08:50:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAuoL5p4dyhMXpDBc1adi8goDuN5O9Jt1ihLwwIPoBpOvLXYRZkYCDL2/FKcxqbTq7KboFDqnpuv3yM4vB1RDwFBI6w0E7GseCNgs/Y10ckH7DKvMG9guE5bfbHdeWRzLCUqMZjmufCz014potNL7UAvRGO62hLrh+4rSK+yuLTZB9UQ3UFnhyc+Ih9nRkPjXrAmdbUDp0d8gvqz5x7TKlfu8JOVgolIDU5UNC8GGg0jUEa0tSEFPVZTEXFQ74LkitNd4ZRARP1sWarNiKHPwSWCEcEv9u38Q8gdOLlIijBx+8gkEm4MBbjWEiLZJt/U6anD/f4a3K3g2KDQiNGgpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ccOjH4U5ZLihVh8WAibZSAYYBO4ImtOs2UMnmc8KAcg=;
 b=B3DDdrh6GH2af9UovD6rx6hX+wSRbbd6ND6PjjYP2Q77+eTGseUfT4gWDe/Bb9X9/ujhdkXcbZ7kBXvIyoBFNl2n9zMkg1F6nrdogiGg9hw85pTZS1THpJ4U88+ZJJcbS8D6sdi613pLtJDAwlDgT+PlekOVCh8w0Oxs/Vqw+mf3lJw+S9QmKhWP4WrHqvzCffflvAkiHXXIw6Q0tgD5EQUczzaGQ2Fw5XfJTCXgbBmzIHuOrmBmfvRe7q5QEh3kFJCZhBNuj1Dj3ucmi+2cGq7La++/lCEnM0aO5npTQQgrlyIEUoksNuc3dCXqS80xGY4TjDQrKg9QbKw0DVUIWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ccOjH4U5ZLihVh8WAibZSAYYBO4ImtOs2UMnmc8KAcg=;
 b=Mb63dsVOylMgGDsEnJDGWmMzwArA5Ga7PKav3uakdea2pxbes1H24YpbtrvknRkA6Neam1wzLKooLDoAa8mMZhZDMybTPDYS4m334tnc6NazKPsGdZy5ufx6o6TGxPZn6LizakyrvbPgvr0X/V1mpVOfH45/ZBs5imbKV5cDitM=
Authentication-Results-Original: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (2603:10a6:20b:85::14)
 by AM6PR08MB4039.eurprd08.prod.outlook.com (2603:10a6:20b:a1::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Mon, 4 May
 2020 08:50:08 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::78d3:4ffd:f7da:b26d]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::78d3:4ffd:f7da:b26d%3]) with mapi id 15.20.2958.030; Mon, 4 May 2020
 08:50:08 +0000
Date: Mon, 4 May 2020 09:50:07 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH 1/4] devicetree: bindings: Add linux,cma-heap tag
 for reserved memory
Message-ID: <20200504085007.5yrjhknkg6ugbqwk@DESKTOP-E1NTVVP.localdomain>
References: <20200501073949.120396-1-john.stultz@linaro.org>
 <20200501073949.120396-2-john.stultz@linaro.org>
 <20200501104216.4f226c2a7bzval5o@DESKTOP-E1NTVVP.localdomain>
 <CALAqxLVScV1j-zxw=cwpE0+eDoaubchXx6SJgu=1Zvh8HnE-Tg@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CALAqxLVScV1j-zxw=cwpE0+eDoaubchXx6SJgu=1Zvh8HnE-Tg@mail.gmail.com>
User-Agent: NeoMutt/20180716-849-147d51-dirty
X-ClientProxiedBy: LNXP123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::26) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DESKTOP-E1NTVVP.localdomain (82.1.208.173) by
 LNXP123CA0014.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20 via Frontend Transport; Mon, 4 May 2020 08:50:07 +0000
X-Originating-IP: [82.1.208.173]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0fdd7b42-03df-4f7a-ad49-08d7f0082b70
X-MS-TrafficTypeDiagnostic: AM6PR08MB4039:|AM6PR08MB4039:|DB8PR08MB4187:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB4187DE809F6A5E4F0BCF8AA7F0A60@DB8PR08MB4187.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;OLM:3513;
X-Forefront-PRVS: 03932714EB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 5aqkfSzawpaRGdgh5I+KcYz/6WcivLoO6/DG8JpWeatju/j35p/g7hEEeuQTx5LSNabZm1nIXnJ/qLxw12L8HLS1jy7+lz6O0+ucX2QmwsNGds4Hn5XMOTgdxC2UNBB/SXdjuuV3U9177N6ku241jPPzRQ/O/13M8Ge6wB+qyMGmb7RbFU7jNO9NdsOAiQDxIUuD6oeZ52hFwqpKfw3jEGizY7iglAm4WX6i9elJDBkIuHhEWkLb7Mu/dfAbX1WI2s6iKt7OEyIH1aHbmO84gFfxVVltMtVg+md7esKlGKGcr9YP06I+I47iRCANHfjS2xk2PkmnfsS480atEfcWIVt88BE+whAbIx3hjm7qoWIu67pzyABTr07HDb3RY8pwEZr6LTM3Qni930CrMMhx1tN5L4quDK+zflnkv7YpOtRsD1H1MfUKlM/k00+1Iegh/FlGprg1NDM45ldKYc7IXBBktw4ufv84iLGM8VMjonptcdzidWCJXOQDAyjgjsbB
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3829.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(86362001)(6916009)(52116002)(2906002)(7696005)(66946007)(9686003)(478600001)(5660300002)(16526019)(186003)(66556008)(6506007)(53546011)(66476007)(26005)(44832011)(1076003)(956004)(7416002)(55016002)(8936002)(54906003)(316002)(8676002)(4326008)(142933001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: PjXOCi9sreftXgJc64m9gRBwy8tZkkmGzDCG4ZvgEtLy3S3GQzWK62il6VVM48kCv9LqrCplVroT1It4eRoOvhmzPxyRCNZm6sAXwdNEM62uazFdiJj4Cnk95MBlfERAjsUeV1SdQs5a0vV1gQ1j0ToU6c+MtuS7WN9SMu/7Iy+5nyr1aQRBJd6ToQxx5kBsKJouUf6b85tfvm1lmhh0LJ3O2tSutSy4nOvcrPbV5zS80dTcEXbIVnG88LJRjxyKYKGBf4ni4qUFhkYGdmk7vcJ1Ni2JZHJ9z1DvM7m4gu8WqMVHfFpnrmELj6YwSTM/QQP/+D5osfCdSbrRqNxzWQSKpd0Jgkpjd4zC21pePtCYuRQ/E6oD3UDJfOgfaYec37eTNqg15bI+N7fj5ClTr9DLXfE3rUyqgJTNcUoqtgiEYciiDbAPgFRsrONIL5s+xQ8ghqjoTqA5nokQRN2Mq0C4S7aRvYZuoH3sttQ0sZIh/baODO4jVBCS4aDoGlKZFezHb0aPm/6tmB/zkTe3OWHuySU9QRmg8Hv9vlx2uT3Pe0CE/vaxQLhwiraun9sa0LDKIAxoHxx/xU0qbx9Pje01x/ILqqIJDmdDRReKATHTVjtcqiX2sAJ5z4YJ+m7fI2PqfSy5lQZdSj/bRoCFLwphrOUR+Fv/UVakC0cKDj7HgoUnukV7CxmWVk/41TRb0Bpjc5871+R4ZQQ+Wx6OhtLsOUUk7R+zoJbxYjmrcacYIxYA0lLj7cF/uQwPVWRBWUyNkS9WCIMMMPQ3pk59+1Oi9VgjODNfeSWwGkHRU8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4039
Original-Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(46966005)(2906002)(186003)(47076004)(86362001)(16526019)(1076003)(478600001)(6506007)(53546011)(5660300002)(8676002)(8936002)(55016002)(26005)(7696005)(316002)(4326008)(70586007)(70206006)(336012)(54906003)(6862004)(81166007)(356005)(82740400003)(9686003)(44832011)(956004)(82310400002)(142933001);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: cb0f6ef8-cfa9-4aef-0c4d-08d7f00825cf
X-Forefront-PRVS: 03932714EB
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5815IbdMwFKpkfPHa0eTWTAwHPM9oH+zdDSVmBndCN1FclGY04ZN6WSOXwyC+1BB4wtSqX1NmZcQDdlayMnTJxAkw/yd2TdFO2C3kU6EogOr3Fxjhnq26J9H2ABX8qNGBNeoDal1/fgEiPFY+0XWzmeUFE1aHVfvHgdODn0SMZFZ6w8wvDkWldcTEJdPpcbbEeuw+7NqXOG2tzrCYs8MuPlamslHHuInz60D7Gbmyy/PF32ijb8k4vGAhgXmX1bONWODloVgKj4kcP2suT6TpWgPMEdEIRSX/OzSM+VVX0NwPrVSg8tTtDpgrjRKTJaMmkCtzSbtiF6Jy+PT6PWOJgIQL7GXc4x9OHz8ZmrRbB7XDvn98IUCJMxl0Ah2YPCdT/VZ6bRlaqJI6AlzhlEuY4zL/Tnhky1TrtwqWkifRgUabfXj8rjCu3EviGTQpZL4UNPDzX3vgXt9jHwNhrYJbqPupWXSSrIJ9eftc1r10VfH4Reklqt1z9HHgACgfTdL7fY44VFtT2UBlytz4ruO+XJPY7JZnKMSJCrV1gwFw1c=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2020 08:50:17.5293 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fdd7b42-03df-4f7a-ad49-08d7f0082b70
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4187
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, nd <nd@arm.com>,
 Alistair Strachan <astrachan@google.com>, Sandeep Patil <sspatil@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F. Davis" <afd@ti.com>, linux-mm <linux-mm@kvack.org>,
 Rob Herring <robh+dt@kernel.org>, Christoph Hellwig <hch@lst.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Laura Abbott <labbott@redhat.com>,
 Pratik Patel <pratikp@codeaurora.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 01, 2020 at 11:40:16AM -0700, John Stultz wrote:
> On Fri, May 1, 2020 at 3:42 AM Brian Starkey <brian.starkey@arm.com> wrote:
> >
> > Hi,
> >
> > On Fri, May 01, 2020 at 07:39:46AM +0000, John Stultz wrote:
> > > This patch adds a linux,cma-heap property for CMA reserved memory
> > > regions, which will be used to allow the region to be exposed via
> > > the DMA-BUF Heaps interface
> > >
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > > Cc: "Andrew F. Davis" <afd@ti.com>
> > > Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> > > Cc: Liam Mark <lmark@codeaurora.org>
> > > Cc: Pratik Patel <pratikp@codeaurora.org>
> > > Cc: Laura Abbott <labbott@redhat.com>
> > > Cc: Brian Starkey <Brian.Starkey@arm.com>
> > > Cc: Chenbo Feng <fengc@google.com>
> > > Cc: Alistair Strachan <astrachan@google.com>
> > > Cc: Sandeep Patil <sspatil@google.com>
> > > Cc: Hridya Valsaraju <hridya@google.com>
> > > Cc: Christoph Hellwig <hch@lst.de>
> > > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > > Cc: Robin Murphy <robin.murphy@arm.com>
> > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > Cc: devicetree@vger.kernel.org
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: linux-mm@kvack.org
> > > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > > ---
> > >  .../devicetree/bindings/reserved-memory/reserved-memory.txt    | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > > index bac4afa3b197..e97b6a4c3bc0 100644
> > > --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > > +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > > @@ -68,6 +68,9 @@ Linux implementation note:
> > >  - If a "linux,cma-default" property is present, then Linux will use the
> > >    region for the default pool of the contiguous memory allocator.
> > >
> > > +- If a "linux,cma-heap" property is present, then Linux will expose the
> > > +  the CMA region via the DMA-BUF Heaps interface.
> > > +
> >
> > Would it be useful or even possible to give some indication of what
> > the heap will end up being called? I'm afraid I don't remember what if
> > any conclusions came out of previous discussions on UAPI for heap
> > enumeration.
> 
> So the name we expose is the CMA name itself. So with dt it will be
> the name of the reserved memory node that the flag property is added
> to.
> 

Yeah I'm just wondering if that's "stable" so we can say "the heap
will use the node name", or if saying that would cause us a headache
in the future.

> > I suppose CMA names haven't been relevant to userspace before, but
> > they perhaps would be with this change.
> >
> > Alternatively, leaving it effectively undefined doesn't tie us down,
> > and something like links in sysfs can be added as a richer API in the
> > future.
> 
> Hrm. Mind expanding on what you're thinking here?

Super hand-wavy, something like:

/sys/devices/blah/display@2f000000/cma_region is a symlink to
	/sys/class/dma_heaps/heap_display

I think danvet had some thoughts in this vein.

Cheers,
-Brian

> 
> thanks
> -john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
