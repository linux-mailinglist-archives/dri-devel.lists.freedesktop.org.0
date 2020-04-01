Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2672719AF44
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 18:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B17176E954;
	Wed,  1 Apr 2020 16:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48FFE6E950;
 Wed,  1 Apr 2020 16:04:20 +0000 (UTC)
IronPort-SDR: mdnsAC9c6ILDtJ0BRvGBpSbp7CqiVpyHmugrh2KlnivbOpgrg2YnsfioNoObnCTceka6dm7K5X
 46QMYt5dx8XQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2020 09:04:16 -0700
IronPort-SDR: JTMmFDBHOceWxhfu50opQ7m1HIP/jg9hfKGFGq5/xlnpCjsWOEraJC1TDLOqnxoj4K3BUDUokL
 BXnOFCOHzYuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,332,1580803200"; d="scan'208";a="359902109"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga001.fm.intel.com with ESMTP; 01 Apr 2020 09:04:16 -0700
Received: from fmsmsx163.amr.corp.intel.com (10.18.125.72) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 1 Apr 2020 09:04:15 -0700
Received: from fmsmsx107.amr.corp.intel.com ([169.254.6.38]) by
 fmsmsx163.amr.corp.intel.com ([169.254.6.106]) with mapi id 14.03.0439.000;
 Wed, 1 Apr 2020 09:04:15 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>
Subject: RE: [PATCH 1/6] dma-buf: add peer2peer flag
Thread-Topic: [PATCH 1/6] dma-buf: add peer2peer flag
Thread-Index: AQHWBprqTM/PpRrbtE2zwMzJ5c48MKhkmzkA///TXAA=
Date: Wed, 1 Apr 2020 16:04:14 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E8663FFFC63C1@fmsmsx107.amr.corp.intel.com>
References: <20200330135536.2997-1-christian.koenig@amd.com>
 <20200401113446.GR2363188@phenom.ffwll.local>
In-Reply-To: <20200401113446.GR2363188@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.108]
MIME-Version: 1.0
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Daniel Vetter
>Sent: Wednesday, April 1, 2020 7:35 AM
>To: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
>Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>Subject: Re: [PATCH 1/6] dma-buf: add peer2peer flag
>
>On Mon, Mar 30, 2020 at 03:55:31PM +0200, Christian K=F6nig wrote:
>> Add a peer2peer flag noting that the importer can deal with device
>> resources which are not backed by pages.
>>
>> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
>> ---
>>  drivers/dma-buf/dma-buf.c |  2 ++
>>  include/linux/dma-buf.h   | 10 ++++++++++
>>  2 files changed, 12 insertions(+)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index ccc9eda1bc28..570c923023e6 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -690,6 +690,8 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf,
>struct device *dev,
>>
>>  	attach->dev =3D dev;
>>  	attach->dmabuf =3D dmabuf;
>> +	if (importer_ops)
>> +		attach->peer2peer =3D importer_ops->allow_peer2peer;
>
>So an idea that crossed my mind to validate this, since we need quite some
>bad amounts of bad luck if someone accidentally introduces and access to
>struct_page in sg lists in some slowpath.
>
>On map_sg, if ->peer2peer is set, we could mangle the struct_page
>pointers, e.g. swap high bits for low bits (so that NULL stays NULL). On
>unmap_sg we obviously need to undo that, in case the exporter needs those
>pointers for its own book-keeping for some reason. I was also pondering
>just setting them all to NULL, but that might break some exporters. With
>the pointer mangling trick (especially if we flip high for low bits on 64
>where this should result in invalid addresses in almost all cases) we
>should be able to catch buggy p2p importers quite quickly.

The scatter list usage of the struct page pointer has other information in =
the
lower bits for keeping track of linking and other stuff.  Swizzling the page
pointers will probably make the scatter list unusable.

Mike

>Thoughts? Maybe add as a follow-up patch for testing?
>-Daniel
>>  	attach->importer_ops =3D importer_ops;
>>  	attach->importer_priv =3D importer_priv;
>>
>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>> index 1ade486fc2bb..82e0a4a64601 100644
>> --- a/include/linux/dma-buf.h
>> +++ b/include/linux/dma-buf.h
>> @@ -334,6 +334,14 @@ struct dma_buf {
>>   * Attachment operations implemented by the importer.
>>   */
>>  struct dma_buf_attach_ops {
>> +	/**
>> +	 * @allow_peer2peer:
>> +	 *
>> +	 * If this is set to true the importer must be able to handle peer
>> +	 * resources without struct pages.
>> +	 */
>> +	bool allow_peer2peer;
>> +
>>  	/**
>>  	 * @move_notify
>>  	 *
>> @@ -362,6 +370,7 @@ struct dma_buf_attach_ops {
>>   * @node: list of dma_buf_attachment, protected by dma_resv lock of the
>dmabuf.
>>   * @sgt: cached mapping.
>>   * @dir: direction of cached mapping.
>> + * @peer2peer: true if the importer can handle peer resources without
>pages.
>>   * @priv: exporter specific attachment data.
>>   * @importer_ops: importer operations for this attachment, if provided
>>   * dma_buf_map/unmap_attachment() must be called with the dma_resv
>lock held.
>> @@ -382,6 +391,7 @@ struct dma_buf_attachment {
>>  	struct list_head node;
>>  	struct sg_table *sgt;
>>  	enum dma_data_direction dir;
>> +	bool peer2peer;
>>  	const struct dma_buf_attach_ops *importer_ops;
>>  	void *importer_priv;
>>  	void *priv;
>> --
>> 2.17.1
>>
>
>--
>Daniel Vetter
>Software Engineer, Intel Corporation
>http://blog.ffwll.ch
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
