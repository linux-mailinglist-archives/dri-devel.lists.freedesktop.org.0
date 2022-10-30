Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 995F4612BCD
	for <lists+dri-devel@lfdr.de>; Sun, 30 Oct 2022 18:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93C610E093;
	Sun, 30 Oct 2022 17:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4284210E093
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Oct 2022 17:18:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXSdS9xq2cZWp6FliUXm3Fw2d7R5AxsJ74NH8T8RgiJ8KQpM62WhrCP4z7k8Nz1QIYW1ygvRGr0lm+jS4dgBJzur3Hk0f+tM8GxMUU6xqg4OU4LnY/XLXuWhHOlvzV9vg8mCyabQZuapFY0HrCyOtWfaXNzKlb0THSsrqd6t3N447S3i9WcHtylwlSqivrBHYpCno9A74oGlETamT+MPwt5xhMNLy/iD4svJD3lQCyvsAvoNAdlHt8E7AmKcivLQdimMXhy5SDCvW4A4rWgjGdsaRiTEyrJ4pHf0d6NJGyaHz49f3/Ie0qkBNSC50I4wxK5Y/SfpDR8Rg/pVVRQeGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBEB+XU1Y3v8CgpdrFfFMlqIo9NuepkdHNtccG1o9XU=;
 b=XXVPH5Ijf7SGMlKbVzvJgxcfKM+NhS6iMoyNOh9f83DTW5Uw0JEI9O0SFT/3GETD4mBAm+br8PWCUVaeRN1DGa9xwBS6qWLz81Q92KjnnuqkujitYcKezR/3VOOCGcrtYNi0bIakzgbLekPAxAWeVh+W2sN1E3TQUFASqWTDI2wXbOSN67BNpz1CikrF6Pq0eaRRUjhGEHTDFOOVdIjB8r176LJ7kQlw/FgPMgPm8zvdqenkbiwE1twVvnVIR24KvDV7xjBlnHA99ObmxadPcHJzzeoBu1qQq8siRtcla3mBpn+lb3uTcjaIALmizFch0moExJUCQoANCb/HYejivQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBEB+XU1Y3v8CgpdrFfFMlqIo9NuepkdHNtccG1o9XU=;
 b=WnJtzsYzTNs6pa+Z2mwfy1qqtUkB79AwZ2YbfMcbZs+L9PXAwf3EUA8YHEJu/b85nGry3HEhBjAalXWrRJMyFWDtv6ZswjjfybPSLs87pVL8k2hcnkmfwWmuDGbucQ5V+5Giqk9Qqwk2bdb1AQN6bpzTfKlEvmyJKgi08vojpUM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DS7PR03MB5637.namprd03.prod.outlook.com (2603:10b6:5:2ca::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Sun, 30 Oct
 2022 17:18:50 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1%6]) with mapi id 15.20.5769.019; Sun, 30 Oct 2022
 17:18:50 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] Add pixel formats used in Synatpics SoC
Date: Mon, 31 Oct 2022 01:18:05 +0800
Message-Id: <20221030171807.55837-1-randy.li@synaptics.com>
X-Mailer: git-send-email 2.37.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::23) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|DS7PR03MB5637:EE_
X-MS-Office365-Filtering-Correlation-Id: 05f96525-ab6d-4952-169c-08daba9acfd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jJ6C5v08r24ALfLwK2pOzKq8QYxA2yX1MSo8RRhWert09J2SxvFCKJMV8f+99befMZKs51yy9AI+Ic9oqWHgm3Wsp4mpDa2HbKCaPJd82y719/ViooswnJqW2ftiFYkrLuaMuMJ1GRjobxNLuVYJB62kNtudqYSbU3uGAzkKtyMqR6PcnbuZ5LS5ZL3dIi4oHA7u8Ib8kmQ4DWlorGS2ZdovFQ82Z8ZQfSwx4M9GdjKw50nJDsi/Qyy4vaTlasbqBpD/4o8mMMFQNmt6zL1JPCcbVAtWvOKO8n5yy0mIPqbNhv0EQ7ldgvSKTQUs1HSMUr7UKFV4fCy4cFfHFpz+GcdET7iC5jX0/t08+yiwXWqj0pe5j9En9rLFL+ThhBDBYOP81yYO9uobt0w3EVxOoTGj5/sdZS+3aZjbcgUytRQi09IoQeLWAUzAgRbR3kQXnIgB3aB17DdKYmGPtnEn6vzRK5p8JMJl3ldOiu79ep2xlQyb6Ib7+w3YnjADZVtvoRyP34cf1AQXMvvQik2d9woBkmvSrD85fiPvXLUcbGb09QSnqqLZGctEZmmxm/dZXvd29OYufx5cCYQKJJTcHSZurgAWmWTRxNgNTSy/MVK8K3HmmnnivyKOfqgY7jrcBeKLLlMpy8cbpE8hrTBYoiBu+4NKKvW1iK8bfSK1vvvalDogztjoi1Zl3qX64GKOzzmx3y8BqoM4oSXOBzkAV0KUXom+rmwtYu+NMYKh6k8TATinqV6L70hLxHw9fjw6lDCITRVak9lKj/InwEUvtHuAc88YOP/FUmMkE6uFM8w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(346002)(136003)(376002)(396003)(451199015)(6486002)(966005)(6506007)(107886003)(6666004)(478600001)(316002)(6916009)(38350700002)(6512007)(2616005)(36756003)(1076003)(26005)(52116002)(38100700002)(83380400001)(186003)(2906002)(86362001)(4326008)(66556008)(8676002)(66476007)(66946007)(41300700001)(8936002)(5660300002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+hPhZ4PBN2ex7EBpbgPOZ9pJH9xipQDrZDsr5pihugS7l8CmiwM8aDwWyxfT?=
 =?us-ascii?Q?DJFcmi3d1ZygvNQ4Glpv6AWdZeUNRKX13Hy82RAJC6K4GwV7EIL8p3dXVyQq?=
 =?us-ascii?Q?iscJQ/xxYATvZsjZoanMG+D00UmEGdWFM3R0JXYUGWJ4zDS4bkZFRaZIek9M?=
 =?us-ascii?Q?7d8gBaeWA98ofT99+l+NgHm8DfKFvl8LF8ftbYO0S1aG3G/5+oAjSqH9SSMt?=
 =?us-ascii?Q?uZOKe9wX762YFlrjhlyAkd+JBoHHPbNfwN83hCeiU8cLVWO8b7EU+tDopun/?=
 =?us-ascii?Q?N9ykXwMd7Ymgnyp+srCbatlxxnz4xO8ttfS1nfbHIvZwYVlnE+7yUkQZ88Sm?=
 =?us-ascii?Q?6ruNCn996yUuNAIz2nWKgXL9cNAv8uy057hzXAml23fNNW9YTiUzAlrtEgcW?=
 =?us-ascii?Q?xg7s6N9dWAuXKfK1ZhcugSgA3UUF0oXTMbXReJTPq6FhAqsYn4E3aOaSRKjb?=
 =?us-ascii?Q?IKC17G1Y1RGak/xdhvPonxf2XOLxBE7/Tqli6SszJ/TUYy5keSR/SUZ6oDpF?=
 =?us-ascii?Q?ErdmO2yEk8zABXcnvoNUgLJXYtXI9vkU+RB8oIQxWNN2i3I3URIyYLXAcbeV?=
 =?us-ascii?Q?i5Uz2h4LK0tC4CYtulqG/x78vxUo8rRMNUB4uScJqK3x56Q+ho/eDeZPwACs?=
 =?us-ascii?Q?GU0/3E8vUfMfJnRBD2MlVnxS0xdM699lxUEoBvDtyyO9wN0Gt638bM9VdI9L?=
 =?us-ascii?Q?E3ophp35iMHqt8nGsvIkw4z326orJAqBk2Hq//BuJQw0gvYuAiivGywiU3GQ?=
 =?us-ascii?Q?+xcQ+5RjHipn6/k9BLXEFU+qUd+VUcXq10FNMY3B1nfIDIBq7VSfaZ13lBG8?=
 =?us-ascii?Q?lqN1/Tdb9ZiOg1B7/cl/mz5PtY6/xliDk9mDOoyim6VcFEAWc1qcdLKoFfnK?=
 =?us-ascii?Q?cYsV0eLvsp+Jjsmsd2m2m1VrPl3RBV5kiSBISVAaORQK9Rvq8NNvROcP/aN0?=
 =?us-ascii?Q?wdRjcXyISjse1gVJ/hJ4hTfcVrWWPaGm5Pb3mKg8R5vLyy1J5JdFC4DSALe2?=
 =?us-ascii?Q?Sfmp615OnAk+ZttCpxeA6VI2T2eY97gSW/ngG0GuLN6ReqJkIZopQSrI7K8m?=
 =?us-ascii?Q?Qy96nYGW7I1KP71BIq5ieb0e8cQMabk150/Zzu4+sIUfiVORCx6EMbz5ZwMz?=
 =?us-ascii?Q?Q5nSO3mLepE8U/KCHUq5K9Ic3CPMEHs2ZVzxcKEVESlhw4B6hzaz/vZVyYXZ?=
 =?us-ascii?Q?sl1XAc4SveJ4eJqZ15hnWNuiL5Q/Kp36T5ZLJTBJW4gcwxHfDsw+16uxqOD3?=
 =?us-ascii?Q?c9AaOxJZsyubIVAN1XdfwDuXVon7NdgWcN8Mrc2ZXdoLeYRjGLzMIgpjRP8T?=
 =?us-ascii?Q?b3V9VMQqkFwqZEo8yhOIRJj/QvrQlvogANCRj+WCinEz1jEZDjLXXd7EIM3n?=
 =?us-ascii?Q?qywt349u1gtRnugpYYMqxCtKZnHM1ndAJsuDymq6RxzvW9sR0fqOii4BokDf?=
 =?us-ascii?Q?LsgCzzqE96ZD/yV/hIlYxdiCeSzsU53BK5Jpg/ZZ7jr2/EAALpNkvnIPtDgj?=
 =?us-ascii?Q?Vn8+2jQq2ltL4u2yU2ChUN4e5/VnttxXTX9JW93M10n+7LfcShgjRsabNxWd?=
 =?us-ascii?Q?iMIfbE+N3jiqG7+YseBFPdBPc6S16ced0ynPMrWE?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f96525-ab6d-4952-169c-08daba9acfd5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2022 17:18:50.4361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: koDeBjE6nd3jjRndjQ//5iVjz7KA1CPtYpTG8fu7Kl6DJna1lndXw5Xp/NdDg/M1CKaWEubHGP9/4e4fB2aw9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5637
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
Cc: linux-arm-kernel@lists.infradead.org, nicolas@ndufresne.ca,
 tfiga@chromium.org, laurent.pinchart@ideasonboard.com, tzimmermann@suse.de,
 sebastian.hesselbarth@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com,
 "Hsia-Jun\(Randy\) Li" <randy.li@synaptics.com>, helen.koike@collabora.com,
 ezequiel@vanguardiasur.com.ar, ribalda@chromium.org, hverkuil-cisco@xs4all.nl,
 mchehab@kernel.org, jszhang@kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>

Those pixel formats are used in Synaptics's VideoSmart series SoCs,
likes VS640, VS680. I just disclose the pixel formats used in the video
codecs and display pipeline this time. Actually any device connected to
the MTR module could support those tiled and compressed pixel formats.
The more detail about MTR module could be found in the first patch of
this serial of mail.

We may not be able to post any drivers here in a short time, the most of
work in this platform is done in the Trusted Execution Environment and
we didn't use the optee event its client framework.

Please notice that, the memory planes used for video codecs could be
one more than display case. That extra planes in the video codecs is
for the decoding internally usage, it can't append the luma or chroma
buffer as many other drivers do, because this buffer could be only
accessed by the video codecs itself, it requests a different memory
security attributes. There is not a proper place in v4l2 m2m to allocate
a large size buffer, we don't know when the users won't allocate more
graphics buffers. Although we could allocate it in a step likes
STREAMON, it would lead unusual delaying in starting of video playbacl.

https://synaptics.com/products/multimedia-solutions

Changlog
v2:
The DRM modifiers in the first draft is too simple, it can't tell
the tiles in group attribute in memory layout.
Removing the v4l2 fourcc. Adding a document for the future v4l2 extended
fmt.
v1:
first draft of DRM modifiers
Try to put basic tile formats into v4l2 fourcc

Hsia-Jun(Randy) Li (1):
  drm/fourcc: Add Synaptics VideoSmart tiled modifiers

Randy Li (1):
  media: docs: Add Synpatics tile modifiers

 .../media/v4l/pixfmt-synaptics.rst            | 80 +++++++++++++++++++
 .../userspace-api/media/v4l/pixfmt.rst        |  1 +
 include/uapi/drm/drm_fourcc.h                 | 75 +++++++++++++++++
 3 files changed, 156 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-synaptics.rst

-- 
2.17.1

