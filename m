Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AEE264447
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 12:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D446E900;
	Thu, 10 Sep 2020 10:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2072.outbound.protection.outlook.com [40.107.20.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C086E8FF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 10:39:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glBdgkf3gna9fMh/e4kCcbX6Mr9kiCAfksUj+92+KjMZAUdHoy1GbeTZ0c304Fuzi57YjXcZH6UP5Gkrq1ZSl79gE6n3MbtiFs1sO+GamIr4uO9LBZ2wbZ1s4AcQaJKWAkg9daKVmrDyiW7+fdXDbW1yrUVsTxbRZEXUTGkNwj8j0QEO3CHy3vmEBaj4sLmo8abt5KSzJQkSwnlm13Ax/YlVsISvM+h1bLZnXl6rFbxXOWJfjhVVW4K8+V0fr9x0rMnIse8t7J4w92DRFALV7UjKuQapW8UfTU7EE3zT3jxa9a6MBf5xRANSfpS3EIcR5K279C9etS+9I5XIpGfFWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D79Kj2jzlIrb4BEl5OjERmWdOjsNY0FQJ4Z2rsxMWCc=;
 b=AtKNUlCpI7FMKBaBpmW+XAVdjqYh3SkVI3oQGSedGHv0cC8oSBTXKWYg9LP5pAdd8aVliEyVoCRbTnLu4dY91R3YjV6KFdNZ7hcaXXVPweOSuC/zi2Yu8rBOEMFnnbTEnjABH8DMeAkGp26nQxKaNTlwUVC4hGUmBm7eG4W79PUuhd1Q21tkmSLi6paDy9c5luh646nG6odSWNuTjF7BA0rrUhnJ2VXd9j515j1+szuCJq/E5GZIvJjsMMik3xUD/mKQwsOns+RqJcmTNkKXl7hFysrycqJ8J2HmH5bwBDnlBrUzgIYSL9YOBywx8VT1cmVXSK9LsucU6vlj00Sa/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D79Kj2jzlIrb4BEl5OjERmWdOjsNY0FQJ4Z2rsxMWCc=;
 b=ZJLvO5rUAhoxV1hx0lLawGLlW80aurBh9SxxH5AJglAzFUaCef7EO2dKVtVyUGgo+X3hYORbAjt+MXx9l3g7ugAzojxLYTzvh1Dxsejvbr/LgUiX3FN5zUQ9iDrXodOvsGMeKLmvS0f7MeagRyvvtB04FUQJedvITHlvSr/gmA0=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27) by VI1PR0402MB3438.eurprd04.prod.outlook.com
 (2603:10a6:803:5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 10:39:30 +0000
Received: from VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5d66:84a7:26de:67c3]) by VI1PR0402MB3902.eurprd04.prod.outlook.com
 ([fe80::5d66:84a7:26de:67c3%6]) with mapi id 15.20.3370.016; Thu, 10 Sep 2020
 10:39:30 +0000
Date: Thu, 10 Sep 2020 13:39:27 +0300
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: per-plane LUTs and CSCs?
Message-ID: <20200910103927.wqnt4cmyivykretf@fsr-ub1864-141>
References: <20200909105727.f5n5c6zudx2qyz2f@fsr-ub1864-141>
 <20200910102543.11dc9fe0@eldfell>
 <20200910075226.GF438822@phenom.ffwll.local>
 <20200910115026.58dffaf1@eldfell>
 <20200910093009.qkb5yvpyf46uj6mp@fsr-ub1864-141>
 <20200910132803.14dc028d@eldfell>
Content-Disposition: inline
In-Reply-To: <20200910132803.14dc028d@eldfell>
User-Agent: NeoMutt/20171215
X-ClientProxiedBy: AM0PR04CA0130.eurprd04.prod.outlook.com
 (2603:10a6:208:55::35) To VI1PR0402MB3902.eurprd04.prod.outlook.com
 (2603:10a6:803:22::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-141 (83.217.231.2) by
 AM0PR04CA0130.eurprd04.prod.outlook.com (2603:10a6:208:55::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.17 via Frontend Transport; Thu, 10 Sep 2020 10:39:29 +0000
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c196b519-7f51-4c18-ecb2-08d85575cc99
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3438:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB34388837457941BF8C7C7ECABE270@VI1PR0402MB3438.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k+UgWpSQi6nFeCDiBZUC/mTpvd0KP4YXMK3Jj36qZayyQLJoX6x/HRs9VbsHaQOt2HilCh4A6PCNFgEYu7OwtE/vB5zLwrZP/fWinvKZuI1ERLcL2dixLbvtPcT2E1qgqSR7NDWsb8djF/KTC4YsXRqkioAEbanNxPQspwpwuK35bizbcw4gMFdMU6BZxApucZ9Lv7cuB3QRPCknahuT5NXtkgndIPO5lTi8WeYXjwX3FxSQYle5Hb+PHGr8/cDdCj/2AU1Qr/twWWV308oAgmy/xwLz56RVBBwvwnV7yb4YuKWHCkBqu13lYJjO2wFw8t8DA4CDhUt0Qrc7NR2q+CQCFIKULhkWuI6Ir8wOMg8G9kGM+Rgwmwn65wy70e9m
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3902.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(956004)(66556008)(66946007)(5660300002)(8676002)(66476007)(16526019)(4326008)(44832011)(9686003)(83380400001)(54906003)(26005)(6916009)(33716001)(8936002)(86362001)(2906002)(3480700007)(55016002)(316002)(478600001)(186003)(1076003)(52116002)(6496006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: /OyUqDR843WV3HkvDjOvb1kED5IAbRu+S5ujERMfAeYpQHlN3uhmJHb1P4dVshNKtat+cVNX7pgW+1SKygiNhT6P0jdxV7cKc8uEW5OC09jcreG4XvTk/h/7jy+ZIkNw1KzS3WMmGREoWDu56BpIltWQHujRhUC+uFqHT8gYUIMs0W4HWH0z7hqFUVHoKoNkC9cOLdLgFbV3x0lLv8sXQmDnOQ+05CEb00v4ppJQfeimWSSgvAVpVe/MMSfw2MTLW0NITSI+yPI0aqq2zCdPO2+XNr6hrq2SuYlmLOCibICEwYkdL9JcbJ5d/0gVetdEVeQGgaUwM06zFbexk99jvqI7RDSBWXOGMRcLBJPuwqrNdrI/9NBRl/YfGzzzyr6hfvSf/c8YwAWeF1A5pkX9zGq3hI0VQX3c3h6XH7BozhZnibomTTyEeDBPgNgPH12lF/zm2FUNN6YSFp4xvmCkGvMev8GDqVKWsn6gvppw9eBUfouQOrZbKj7lnLU6B+V/jSU09EN4ca4UyMk8yZiEsEd5WYNjfvEBvTVqSp77V3LETGkOIJHClaDL11Oapmk//h7vqYX/dIpcB6Sdcb8rZGaPGT1cY/0qrZeezfggtYQBVoa0GyBSRSbrgCfpEeNLyHhjNXsYuvtoP76DtL/OKA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c196b519-7f51-4c18-ecb2-08d85575cc99
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 10:39:30.6168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKXscZXnuniWGCVsOwvnJvXbQKVYzzxSZzypjxkOuX9a+4fBv57tCT1GcESz5h6CRGutCeqpLkFQJ0JPHoPueA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3438
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
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>, dri-devel@lists.freedesktop.org,
 Sebastian Wick <sebastian@sebastianwick.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka,

On Thu, Sep 10, 2020 at 01:28:03PM +0300, Pekka Paalanen wrote:
> On Thu, 10 Sep 2020 12:30:09 +0300
> Laurentiu Palcu <laurentiu.palcu@oss.nxp.com> wrote:
> 
> > Hi Pekka,
> > 
> > On Thu, Sep 10, 2020 at 11:50:26AM +0300, Pekka Paalanen wrote:
> > > On Thu, 10 Sep 2020 09:52:26 +0200
> > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > >   
> > > > On Thu, Sep 10, 2020 at 10:25:43AM +0300, Pekka Paalanen wrote:  
> > > > > On Wed, 9 Sep 2020 13:57:28 +0300
> > > > > Laurentiu Palcu <laurentiu.palcu@oss.nxp.com> wrote:
> > > > >     
> > > > > > Hi all,
> > > > > > 
> > > > > > I was wondering whether you could give me an advise on how to proceed further
> > > > > > with the following issue as I'm preparing to upstream the next set of patches
> > > > > > for the iMX8MQ display controller(DCSS). The display controller has 3 planes,
> > > > > > each with 2 CSCs and one degamma LUT. The CSCs are in front and after the LUT
> > > > > > respectively. Then the output from those 3 pipes is blended together and then
> > > > > > gamma correction is applied using a linear-to-nonlinear LUT and another CSC, if
> > > > > > needed.  
> > > 
> > > Hi,
> > > 
> > > hmm, so FB -> CSC -> LUT -> CSC -> blending?
> > > 
> > > Is it then
> > > 	blending -> LUT -> CSC -> encoder
> > > or
> > > 	blending -> CSC -> LUT -> encoder?  
> > 
> > The DCSS pipeline topology is this:
> > 
> > FB1->CSC_A->LUT->CSC_B-\
> > FB2->CSC_A->LUT->CSC_B-|-blender->LUT->CSC_O->encoder
> > FB3->CSC_A->LUT->CSC_B-/
> > 
> > Basically, CSC_A is used to convert to a common colorspace if needed
> > (YUV->RGB) as well as to perform pixel range conversions: limited->full.
> > CSC_B is for gamut conversions(like 709->2020). The CSC_O is used to
> > convert to the colorspace used by the output (like RGB->YUV).
> 
> I didn't realize that it would be correct to do RGB-YUV conversion in
> non-linear space, but yeah, that's what most software do too I guess.
> 
> > > 
> > > Are all these LUTs per-channel 1D LUTs or something else?  
> > 
> > LUTs are 3D, per pixel component.
> 
> Sorry, which one?
> 
> An example of a 3D LUT is 32x32x32 entries with each entry being a
> triplet, while a 1D LUT could be 1024 entries with each entry being a
> scalar. 1D LUTs are used per-channel so you need three of them, 3D LUTs
> you need just one for the color value triplet mapping.
> 
> A 3D LUT can express much more than a 4x4 CTM. A 1D LUT cannot do the
> channel mixing that a CTM can.
> 
> So if you truly have 3D LUTs everywhere, I wonder why the CSC matrix
> blocks exist...

Indeed, it's 1D LUTs. I got them mixed up... :/ Sorry about that.

Thanks,
Laurentiu

> 
> 
> Thanks,
> pq


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
