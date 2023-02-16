Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 791F369975F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 15:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5479910ED8E;
	Thu, 16 Feb 2023 14:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2122.outbound.protection.outlook.com [40.107.105.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D7610ED73
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 14:26:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1dcnis0rfeRJ1GZfc48CvXAAr88JPGYmUKRUue+HgZFUI09t11R+QjPIYAcCf4Tb7vCW0g6qZRuBgM7Eejkm6fpCgY1rPTZCC62nInhSdFVYbJJXG+4+lHEVdYVRcRfd26JdttghIzIF38Hl5GSEOkiE+OOcRcyXe7qW9SB53/6AXTM+wKiyRpx9+oG5GBMdXmQMdBZTQLg6SatvchLCw8cMOQQToRUcHtzRgeY4XzoZuqEHi2/bWxAUt8ZbJSgm6mQM16vPIuOM/f0nbM9enUEOk2VTAsvgbYtg5t6jEjG6g6iwd6mcFF9mFrUZgUx7TTBuqgbt5dnznPooYDe3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oENrCcNWVFreaTULKHPnOKnnEL0/nfCKtmSK7PVGGi0=;
 b=lNzS+bVG3sD0ZySNGQYg6g06WO2x8lH3Gf5f8xIASRSpdvUyW2T4QfZFns6eaZTGTruIyERjaiK7N/mAhi8RtXBdKkJAJVq2LdgZucI52ZuIxNjGEw85V5DXKmom14+RCPjBrDdUeKQ9dVo9lY+fogviOXeNe/N5mD53bTABYVxO2mvB9jpLCT8QMhpSuaL8vEcOWLito1B8bKt0d86CVU+tXkwkEXarMHEaRsMf18odamt9CHPug0AoyApPZj/jG8rhQeR5TF7qsG5eTm7/Jz0L0TDm1pl+AvHkSUXVuXyTwF26BHlrB6IxA74LHdlUNffeHKdGR8svv1NELrRagg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oENrCcNWVFreaTULKHPnOKnnEL0/nfCKtmSK7PVGGi0=;
 b=Skyz4oJDi2ATiHaS5nsFmsJtzReGipoouGY3KSFUrZEV6W/jtuLkqV0nMteq74IEUl/nMQ2OFask5tiij5q+d9tc9WHxDVcKJRIMgYCP8b19vJwnJSl5urkQXMzMBW407NqWFxYUD0JoyT2jr3u0y6BjkVs+w9fOq9p3rhfBAlX63xPHJ/ShFhWgIJmMHzTdqxToeiYNKtnKSPxU/Wo0EzNRfYC+lMq70kqroYqPfI1S8AARv47YRNZQZLs8+miuyVqrYGQLnl31wJ4svXXEjmcAVjOm7BiSL56f4lwF+JsqJOca6dIBQeF04bJS1WjCJLaCwfk+Xu+n8KxUUyma7w==
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com (2603:10a6:10:2d8::6)
 by AS1PR02MB8026.eurprd02.prod.outlook.com (2603:10a6:20b:4c6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 14:26:50 +0000
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::46d6:40b:b9:61ca]) by DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::46d6:40b:b9:61ca%6]) with mapi id 15.20.6111.012; Thu, 16 Feb 2023
 14:26:50 +0000
From: Tomer Tayar <ttayar@habana.ai>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, Oded Gabbay
 <ogabbay@kernel.org>
Subject: RE: [PATCH 06/27] habanalabs: use memhash_node_export_put() in
 hl_release_dmabuf()
Thread-Topic: [PATCH 06/27] habanalabs: use memhash_node_export_put() in
 hl_release_dmabuf()
Thread-Index: AQHZPyLpc0Kk7ViHs0OJ3pcxI6ayRK7RetiAgAAq4wA=
Date: Thu, 16 Feb 2023 14:26:50 +0000
Message-ID: <DU2PR02MB75736B78964EBB3644911C2AD2A09@DU2PR02MB7573.eurprd02.prod.outlook.com>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
 <20230212204454.2938561-6-ogabbay@kernel.org>
 <20230216114817.GD2849548@linux.intel.com>
In-Reply-To: <20230216114817.GD2849548@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR02MB7573:EE_|AS1PR02MB8026:EE_
x-ms-office365-filtering-correlation-id: 29a2d8f9-dc38-45fe-11de-08db1029d81f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V3nY7HTORbGLE/FiwRHmM5g/XGfTRDkS259DQTjzNBO+SlR5ZJbmPtIv/DC/kXOVCtrzcY4q3BCFiWmFYRfQJbg9TFSeJL5J0yYAKSSOngyKlQSQrcmRHulHBKjE0BdgbkGadMpvcqqrCe7eWDdW7/zLrv4Nt6/butgn2IxW1iULyUF+g759MmcPVOSuUax1aXU8nuB51WrJM2/lwh6M02Aulv60GQkkW8bHlKKRV+Jb9xqJynA6UmBD9ZDu8WpeU9wmvJ5WkijBoRPHVYaf/58wtnwb8lxS4m1LVbCj0zjITWyPQz9MJ6xwyqm+eS9G9rB8RfE5hadb8OlaTalJmELvcGCaOzdsQ8cakICr4tI456JbCqBpZsV44Xn2k5DqZzn3YZF3KNMia25Xmjab4+bDKw4D6SVM65kGZZJzXx2pRk32QM/xKj91jneG2KFVZRjEjXtv5ejlnXVajUshgVsEWkTzwlv3UobC013+l/Vc3Dc9U8KPvBI8t4t+7jJ1Yj3UN5sIza7iG3V6y7rfm6n69vsxRVaOGJ9x+6xqecHTY1rmJIfvMZRX5XCFesW8HYvHO7kqHVdlJR86t8QQ9Jf9M7pqRPpQm7Cv5knzbQHW/bV8Cd6CdHlzGFQ/7442h8wJcbcP/aUK4sqYdmrw/NTNM2zCD7YaTGcD6/pl9qJx+QD0NXWOg3TRHlDhROcdf1mfzxHhN+w189jIjDZmrQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR02MB7573.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(39850400004)(366004)(346002)(136003)(451199018)(122000001)(478600001)(71200400001)(8936002)(6506007)(7696005)(26005)(9686003)(53546011)(110136005)(52536014)(2906002)(41300700001)(316002)(5660300002)(66946007)(8676002)(66476007)(66556008)(64756008)(66446008)(38100700002)(82960400001)(76116006)(86362001)(33656002)(4326008)(55016003)(38070700005)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?drGfZvbnzcIoGe6YEVZjOAOiongGKxuQ9Lrxn6MairwsT5EhHQubnNOvq0NX?=
 =?us-ascii?Q?+46ePh2TZzPAIVk2y4rNQQdGn028034KJ3i00NTY8JT9YHjPDsTF6saYaO0R?=
 =?us-ascii?Q?IhSQx8SnwbaCrQ9A+LpfJBxblZYRLYSSs6WWOnfKE6b52hWmLPzEpSD2gYyT?=
 =?us-ascii?Q?hwOLjKFA8qxL9m20i1l9HkFwAsXTmH3SFXi0sO2ozAUvuFHgWZKWJtoIAnli?=
 =?us-ascii?Q?hw6rd649fvLvWToTBu5j5IF/3UlJcIB6xnmdl5ecX53AOyVisthhDslCDC1K?=
 =?us-ascii?Q?K/m4bFZvKbAz5kjlJmRv81L4Iw0TZNEGlHlAUYXC1B+WOj6M9JKXNv9z2TcU?=
 =?us-ascii?Q?WYLw7UQH5RsJ31cahYVOSipvSYluhFUkfI0/FgxKO5FqW1DUzrnr5JjF88pJ?=
 =?us-ascii?Q?Ryc1kb41ejH/KPtw704dwPsOsRnlCpRooDlfT0FiHKnBsJz5QDrNm/sQJ5xo?=
 =?us-ascii?Q?btB7voyMqmfU/lAo8jcS6GfCzwhAZRsj5m/WfHCWa9+vs0pyd2/jPqBkiX17?=
 =?us-ascii?Q?6I+JmPsuCj+ZSzEGHQ8RrSZPtrlMYq/c71czn0OClSMepoyVEZiBnse+vduC?=
 =?us-ascii?Q?07+CyYbHNtNz48USOS0JL8GwYriPcwiGxvTEFP05HbCfOv1w2Kyfx8PAvKvl?=
 =?us-ascii?Q?nX6EG5PzyQob9/lOMLrq4yJI0fSIm4+FlyR7IN/7RsnZY06aawCbjHQINyfr?=
 =?us-ascii?Q?wsafgBllyBeE1TqbhbKeIeNqpckeqZG2avc6DdAwz/wjs6oSNxjBczXWxPRm?=
 =?us-ascii?Q?VkcY4grs1PZmTO1LmQ2kFv0vN67xqbOXIGqNdsqBnK9UE9b0Z2Sslewmi2f7?=
 =?us-ascii?Q?lM3qgpad31b/2tbj/Epy8AQMz5BAh33W8JzLrcoERgKh+dPCexV0WAup62MD?=
 =?us-ascii?Q?BMtaKQxS8esYAkKPV1hxH2wse99P1SnGKplwyed+DhPlJ35RC5+ynqO55P7m?=
 =?us-ascii?Q?9LCa/cnqea1QkV54mSSglHxp4HKsu/6MtJdZLbBT2m4Tf0QWGfkxNeA5uLRc?=
 =?us-ascii?Q?XNiJT8P4q/ssQ4we2M8nRnl6cBBAII4ivjXh/E19YKRnQSPnd//o/MgxSwvG?=
 =?us-ascii?Q?lqjWvhPtGBXgsjKk19WA6Xx4trobsQrmRMLangvWJ4EXVozS6XLCmvht2tXE?=
 =?us-ascii?Q?7PpqtGNRuYnPV1v1JkLbf6PX7t9ikwX6w7meOAuwLyMq9fgIqyN2ZcN/fW7i?=
 =?us-ascii?Q?1UTA8S+gjoD0INVC5/QKBAoi/Hy0EshV6AGMgQQg3zsycqcKcGnAz4Sr2jd2?=
 =?us-ascii?Q?5ycXWDT4dxu1xxOOeJMM9fLufzJ+8n/E7P0qOdZU6ut227Nag6L5U7p4sweQ?=
 =?us-ascii?Q?/q1IjI/Xi3iIqhSzwMaCgR/b3R/YBHk80Ni2uXV+6m90448eiobzaNEa8+9m?=
 =?us-ascii?Q?hmCENhmilZtMbnNS6LeSJ69+5aeO0vcRdOoZEm26AWrHbicigeGrbrZP10hE?=
 =?us-ascii?Q?lQPrtR2q7lpR9v5G8zKRAY7Kf79NTPpYkGgzim25P76me9nUMzwWzf+lTHwa?=
 =?us-ascii?Q?npofq/YFX6JYRxVdUGlxDG7J2xH7iAlJw2XjK05OFO9pDYD6dPWEbdOSP1mH?=
 =?us-ascii?Q?l8OIgb/Cbe7rmdjwI38=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR02MB7573.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a2d8f9-dc38-45fe-11de-08db1029d81f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 14:26:50.8051 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ztllAPpjJJXk81Xh4rY7Q9yUkNu2Vow9ZKJDSrsRaGsJxO4dEWvaR6Q/PjbEi0fgKIdJqkDoTydvoah3DTzRXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR02MB8026
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 16, 2023 at 13:48 Stanislaw Gruszka <stanislaw.gruszka@linux.in=
tel.com> wrote:
> > The same mutex lock/unlock and counter decrementing in
> > hl_release_dmabuf() is already done in the memhash_node_export_put()
> > helper function.
> >
> > Signed-off-by: Tomer Tayar <ttayar@habana.ai>
> > Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
> > Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
> > ---
> >  drivers/accel/habanalabs/common/memory.c | 89 ++++++++++++----------
> --
> >  1 file changed, 43 insertions(+), 46 deletions(-)
> >
> > diff --git a/drivers/accel/habanalabs/common/memory.c
> b/drivers/accel/habanalabs/common/memory.c
> > index e6474d38afc4..7b3809853dd5 100644
> > --- a/drivers/accel/habanalabs/common/memory.c
> > +++ b/drivers/accel/habanalabs/common/memory.c
> > @@ -1779,6 +1779,47 @@ static void hl_unmap_dmabuf(struct
> dma_buf_attachment *attachment,
> >  	kfree(sgt);
> >  }
> >
> > +static struct hl_vm_hash_node *memhash_node_export_get(struct hl_ctx
> *ctx, u64 addr)
> > +{
> > +	struct hl_device *hdev =3D ctx->hdev;
> > +	struct hl_vm_hash_node *hnode;
> > +
> > +	/* get the memory handle */
> > +	mutex_lock(&ctx->mem_hash_lock);
> > +	hash_for_each_possible(ctx->mem_hash, hnode, node, (unsigned
> long)addr)
> > +		if (addr =3D=3D hnode->vaddr)
> > +			break;
> > +
> > +	if (!hnode) {
>=20
> This looks suspicious, I think hnode can be not-NULL here and has
> hnode->vaddr different than searched addr, in case there is
> hash collision and we iterate over hlist where there is no
> searched addr. Not 100% sure about that though.
>=20
> I think would be better to provide helper like this:
>=20
> 	hash_for_each_possible(ctx->mem_hash, hnode, node, (unsigned
> long)addr)
> 		if (addr =3D=3D hnode->vaddr)
> 			return hnode;
> 	return NULL;
>=20
> which is basically standard way how hash_for_each_possible() used.
>=20
>=20
> Regards
> Stanislaw

Thanks Stanislaw, we will add such a helper and use it here and in another =
place with a similar pattern.
If that is okay, we will do it in another patch, as this one only moves an =
existing function for code reuse.
