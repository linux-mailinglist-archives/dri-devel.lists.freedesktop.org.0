Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 860B122365C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jul 2020 09:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9A26E44F;
	Fri, 17 Jul 2020 07:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130085.outbound.protection.outlook.com [40.107.13.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843B76E44F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 07:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjwK6ihm6YK1QiRtTdMV2UYu4ctVtmpAkvtysJk3HQA=;
 b=VdqgXlIRrQunEIjTlvISFr9B5st4Ql8m+BF+TFsSTMuJEIA39XNteUc9FK1dDN655k+pPvaCG6R965xm0Sx2uCfEn9z6oV1xxAZlxjlRWAw9B0N5ggAigkxhL9U5JXqHMZFakFu8hwOeB454GCtGFlHgPzV9KEagn0bYVPgB9UM=
Received: from AM6P195CA0103.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::44)
 by AM6PR08MB4119.eurprd08.prod.outlook.com (2603:10a6:20b:ad::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Fri, 17 Jul
 2020 07:59:26 +0000
Received: from VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::63) by AM6P195CA0103.outlook.office365.com
 (2603:10a6:209:86::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend
 Transport; Fri, 17 Jul 2020 07:59:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT014.mail.protection.outlook.com (10.152.19.38) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Fri, 17 Jul 2020 07:59:25 +0000
Received: ("Tessian outbound 73b502bf693a:v62");
 Fri, 17 Jul 2020 07:59:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1b03c4195bc9e4d5
X-CR-MTA-TID: 64aa7808
Received: from 21672d42ed2f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 98943E94-C0B2-4F88-874C-5D252BFE6894.1; 
 Fri, 17 Jul 2020 07:59:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 21672d42ed2f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Jul 2020 07:59:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iU9L+XIZMRGX0tyKqSzftN5B8D+vwscwVWO9NUmI1X3QNOWWBWtaU3isVxSAuCZZvEU/ov7vVmEalU9dhqfUA6ZWKXNbTL++pM+BGnOMjGzo1BgHBPOZQ1BUfsl+AUCd+c3triCIZouOnUjULnnpb3TnhB0QqgNc/oWKnM2p3LxERFJ2g/WAP4xVqzVMBOvtAeke5FURvXz7+h2imRUyUUGNn4YoddIJJKLlWOC7DlTDdq1Dbgyt+PrMWHoo+SdjrJ5/Tv64LV2j1nZJte8W5NdMjAzwBNBipN0Cn9od52luUSIocEmeFKenZkrJ7Iio/fFha2XXdi/aKyHWfci4/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjwK6ihm6YK1QiRtTdMV2UYu4ctVtmpAkvtysJk3HQA=;
 b=DQHQwNNGy9SYSiflQqU3XGhGI7U5cuwDUj/PaVoLscNpDqLv8Yxuv4jscU57I5h29gQzoOLSruLi3d0RFTFypSf7HOjYnigrGF9Q9eKPLCYTXc4iZtGgDNt31eUpnbM2qcodxfdxkSLWMhh4rb4ECLzSQMK0qxVp70PeAobYENK8WljgZXt2cS3RiQ40K2gDzQOuAdPZGCyjDkuAC6Zr+IrKVfSsF+/QZ30/YpYNBjhlusO8mrDD23hUyTFsUugYDygN/HJ6VlIqq2nt+QXtbqcMN9MSIYH5r6JkHNfh0eJnHIRfD03w4vgDx1HtvqnBi35Eh9AGt8ASYTTsv6yM4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjwK6ihm6YK1QiRtTdMV2UYu4ctVtmpAkvtysJk3HQA=;
 b=VdqgXlIRrQunEIjTlvISFr9B5st4Ql8m+BF+TFsSTMuJEIA39XNteUc9FK1dDN655k+pPvaCG6R965xm0Sx2uCfEn9z6oV1xxAZlxjlRWAw9B0N5ggAigkxhL9U5JXqHMZFakFu8hwOeB454GCtGFlHgPzV9KEagn0bYVPgB9UM=
Authentication-Results-Original: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=arm.com;
Received: from DB6PR0801MB1719.eurprd08.prod.outlook.com (2603:10a6:4:3a::18)
 by DB6PR0802MB2231.eurprd08.prod.outlook.com (2603:10a6:4:84::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Fri, 17 Jul
 2020 07:59:17 +0000
Received: from DB6PR0801MB1719.eurprd08.prod.outlook.com
 ([fe80::7d48:27e3:a154:17ef]) by DB6PR0801MB1719.eurprd08.prod.outlook.com
 ([fe80::7d48:27e3:a154:17ef%12]) with mapi id 15.20.3174.027; Fri, 17 Jul
 2020 07:59:17 +0000
Date: Fri, 17 Jul 2020 15:59:11 +0800
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH -next] drm/komeda: Convert to DEFINE_SHOW_ATTRIBUTE
Message-ID: <20200717075911.GA79475@jamwan02-TSP300>
References: <20200716090333.13334-1-miaoqinglang@huawei.com>
 <20200717064017.GA76612@jamwan02-TSP300>
 <CAKMK7uEpmhKok9Q3Rrg0v=1p7pv-wpV0Y3-k9GVav+Ad5Z4AkQ@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAKMK7uEpmhKok9Q3Rrg0v=1p7pv-wpV0Y3-k9GVav+Ad5Z4AkQ@mail.gmail.com>
X-ClientProxiedBy: SG2PR06CA0126.apcprd06.prod.outlook.com
 (2603:1096:1:1d::28) To DB6PR0801MB1719.eurprd08.prod.outlook.com
 (2603:10a6:4:3a::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (203.126.0.113) by
 SG2PR06CA0126.apcprd06.prod.outlook.com (2603:1096:1:1d::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Fri, 17 Jul 2020 07:59:16 +0000
X-Originating-IP: [203.126.0.113]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b428836e-ed41-4c67-4913-08d82a275307
X-MS-TrafficTypeDiagnostic: DB6PR0802MB2231:|AM6PR08MB4119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB411905BA56D988B808348566B37C0@AM6PR08MB4119.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 4YZqzeUG/5dv3AcnVECN99CY5FcFVrwRNd8xpGvF8PhXMoINZubNiTuAj3ekwCPpWv9biBQr2eecrivIHtoDQGn22NlZPktyvhsD4yUPPfGP2it930XhfxNMeEZpEakoJzY6pic9s1sgQHkYP8sgyzSRziMCEjyGJjgen5oJ/BrylEJLcjELk5MjqE/T54+dNNjdfJW/w2zBClQwhEwU5DiHfHcvYgARIOkL4DKUFa4A71ph9jDAsBGBpPohrr/Zdwq6OAE6Y+usWSU5bemROQktBCzCwEAfMJOwOfpIIMCz8UvF4CxJi0zNtzBXm1WtBOCDgYrdA7FcJd6jhr5faR3YnSPhCYA0E1DQ1iyEZczTv2bq/pLcqDHZYj8PTaZ/T39qap5O+deQ/90RSlg9sg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB6PR0801MB1719.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(7916004)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(52116002)(6916009)(53546011)(478600001)(6666004)(9686003)(1076003)(316002)(8936002)(33716001)(26005)(5660300002)(6486002)(86362001)(66556008)(8676002)(6496006)(4326008)(956004)(54906003)(2906002)(83380400001)(66946007)(16526019)(966005)(33656002)(186003)(66476007)(83080400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: IoXICDR1K4KkujVBN39+18NJVzeyoUHNANVfvIGZAnm8WsQazLmG4GyRZ7Swgz28UDtHmgD80fVw1vvk14L8TbU2JP25j3gdKV3x43cxABF1LF35c6gVnkBQjFYZWOLFI9ZXCnPfO3sPYCvHuMPjgACh5cNYTiglMY94L/itWDHTBLrlp1cYrdQhcgG519mEDe0h5irpav3e2Fc07hLpJnnczHIoaWp+H9eQYzGAUgKLMZ3nFwxIcfpbU4Iv/r9PIlrv+1G+paXU+4NMZD9qF4f1qJibW73VRf7mLEA3WOA5DBuypaK0UaOXRYSSDqRWeDI+2VanE6S72V+8pgJfKl6FSLtMB6Ghx7DJiLVftnudNeK87tH0zsEO/PD4Bcs2ddYbXtyQmMSALifw4ZgUt24CmUCp52J8Hzs2foBnU5wK6/Xbxb4QXKQSMxK6d6bEDSWZMe9XTQmE6K1lX+X71cK5WcVHe3xlGbuNBRS2TjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2231
Original-Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(7916004)(4636009)(396003)(376002)(346002)(136003)(39860400002)(46966005)(186003)(8676002)(956004)(33716001)(1076003)(70206006)(86362001)(6486002)(8936002)(966005)(316002)(83380400001)(82740400003)(36906005)(16526019)(70586007)(2906002)(54906003)(478600001)(6666004)(6862004)(83080400001)(336012)(81166007)(26005)(5660300002)(4326008)(6496006)(356005)(82310400002)(9686003)(33656002)(53546011)(47076004);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: fde948f9-fc8c-4d0f-2d7b-08d82a274dcf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hdwUWxcdhz7s1syXhnFhcbyMlxfpi7WIlS9sJw61473jxUrR3e1Lkl81zC0TbdUDSho5YldhTzgkxtnUQ5mTHBKT8Uw1MzA3BauW4YYOuWFzhDDoSlL2P8QAq+mfGCrgPMqjK2h/VuB/kl5kbopIfh6VJ7XSsI9CO5aXqu8emECa/IajYRkfSzf4YsLZVMqU5G1KjR8wZ6/L5XvueU7Pk5NOHTkgi0QRGYbjHrqnv2/1E9dOzH42ZyTc4gjXO8SOap6FHP0pMWYDofYVDSed7FwE6omft3qv+pVJVmP+2PxW4enGB6IHxq/rydn0lpIf3II5/MBAjxFHTzHHpB9m9WaJq8nQcTxYzLHVJwUOAdfiScTodIk3dWKeCwmFsVaNcsvJJyIa6Jd5bhDneVWx8kJ4a/jOgCshNNmycCkXk8ogl/CrtKYuRSl6pVR2+WV1CdEkfyeaE7BUnb38DZOose01llcmusJ5r3xph6LF9fI=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 07:59:25.6523 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b428836e-ed41-4c67-4913-08d82a275307
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4119
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
Cc: nd <nd@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Qinglang Miao <miaoqinglang@huawei.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 17, 2020 at 09:06:57AM +0200, Daniel Vetter wrote:
> On Fri, Jul 17, 2020 at 8:40 AM james qian wang (Arm Technology China)
> <james.qian.wang@arm.com> wrote:
> >
> > On Thu, Jul 16, 2020 at 05:03:33PM +0800, Qinglang Miao wrote:
> > > From: Liu Shixin <liushixin2@huawei.com>
> > >
> > > Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
> > >
> > > Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> > > ---
> > >  drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 13 +------------
> > >  1 file changed, 1 insertion(+), 12 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> > > index 0246b2e94..4a10e6b9e 100644
> > > --- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> > > +++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
> > > @@ -41,18 +41,7 @@ static int komeda_register_show(struct seq_file *sf, void *x)
> > >       return 0;
> > >  }
> > >
> > > -static int komeda_register_open(struct inode *inode, struct file *filp)
> > > -{
> > > -     return single_open(filp, komeda_register_show, inode->i_private);
> > > -}
> > > -
> > > -static const struct file_operations komeda_register_fops = {
> > > -     .owner          = THIS_MODULE,
> > > -     .open           = komeda_register_open,
> > > -     .read_iter              = seq_read_iter,

-	.read		= seq_read,
+	.read_iter		= seq_read_iter,

> > > -     .llseek         = seq_lseek,
> > > -     .release        = single_release,
> > > -};
> > > +DEFINE_SHOW_ATTRIBUTE(komeda_register);
> > >
> >
> > Hi Shixin & Qinglang
> >
> > Thanks for your patch.
> >
> > Reviewed-by: James Qian Wang <james.qian.wang@arm.com>
> >
> > Since your patch is not for drm-misc-next, so seems better
> > to leave it to you to merge it. :)
> 
> I do think it's for drm-misc-next, what other tree would it be for?
> Some people put -next in their patch tag to differentiate from -fixes,
> so maintainers know what to do with the patch. It's also not part of a
> series, hence I think this is on you to apply it.
> 
> Cheers, Daniel

Hi Daniel:

I tried to apply this patch to drm-misc-next, but failed, and found
this patch is actually based on linux-next, and the code base of
linux-next is a little different with our drm-misc-next.
and one of the difference is linux-next has a patch (call it patch-A):

seq_file: switch over direct seq_read method calls to seq_read_iter
https://lkml.org/lkml/2020/7/7/1267

which changed code like below:

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
index 1d767473ba8a06..0246b2e94d8cbd 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
@@ -49,7 +49,7 @@ static int komeda_register_open(struct inode *inode, struct file *filp)
 static const struct file_operations komeda_register_fops = {
 	.owner		= THIS_MODULE,
 	.open		= komeda_register_open,
-	.read		= seq_read,
+	.read_iter		= seq_read_iter,
 	.llseek		= seq_lseek,
 	.release	= single_release,
 };

And these code will be deleted by this patch, if we merge this patch into
drm-misc-next firstly before the patch-A, that may import a conflict when
we merge our misc into upstreams.

if we want it to be merged into drm-misc, I think we'd better to wait the
upstream (the patch-A) has been synced back to drm-misc.

And what's your opinion ?

Thanks
James

> >
> > Thanks
> > James
> >
> > >  #ifdef CONFIG_DEBUG_FS
> > >  static void komeda_debugfs_init(struct komeda_dev *mdev)
> > > --
> > > 2.17.1
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
