Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 177F2CD6BFD
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 18:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4C610E6F1;
	Mon, 22 Dec 2025 17:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com
 [216.40.44.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C3C10E07B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 17:03:17 +0000 (UTC)
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay02.hostedemail.com (Postfix) with ESMTP id B497713A662;
 Mon, 22 Dec 2025 17:03:14 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by
 omf01.hostedemail.com (Postfix) with ESMTPA id C220C6000C; 
 Mon, 22 Dec 2025 17:03:11 +0000 (UTC)
Date: Mon, 22 Dec 2025 12:04:59 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: =?UTF-8?B?6auY57+U?= <gaoxiang17@xiaomi.com>
Cc: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Xiang Gao
 <gxxa03070307@gmail.com>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "mhiramat@kernel.org" <mhiramat@kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>,
 "dhowells@redhat.com" <dhowells@redhat.com>, "kuba@kernel.org"
 <kuba@kernel.org>, "brauner@kernel.org" <brauner@kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
Subject: Re: [External Mail]Re: [PATCH v8] dma-buf: add some tracepoints to
 debug.
Message-ID: <20251222120459.644e50ee@gandalf.local.home>
In-Reply-To: <e9046d36a74d4eefbe85936fd2ff7cba@xiaomi.com>
References: <20251218062853.819744-1-gxxa03070307@gmail.com>
 <eb2e048b-ac39-4379-98b8-6dae2145be7e@amd.com>
 <c8dab5d09fa24bc58309062910347e7a@xiaomi.com>
 <e9046d36a74d4eefbe85936fd2ff7cba@xiaomi.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Stat-Signature: wwj8d98jrga53of55yjujmnjjh1jyq54
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: C220C6000C
X-Spam-Status: No, score=-0.09
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+OzYT3+DzkfjjO5N9xkiQl2sy06YlbtSw=
X-HE-Tag: 1766422991-614254
X-HE-Meta: U2FsdGVkX18S7MPFx/Edj80NuArl9Lelu7WD2IEzK5TKzvAaNnk+gxl0qUZlDfx91zxz27wSjt5d/RYbZcCK1AZSUHI4qt19bkAUYeek/NeuJytXJHnZBfqv92CPrIycJmFb9mens+pD5MgVsb7CZn1b7Qu5qGVF1He+fS57QtA2lHdtQOY9MjFmnFNPpLlWsI0JLq5rZkvlUF5cXYmda38409XBom1LzMAB8Rct4O2vsdg+2sF/e9zVHv7v6HcBoXYuo6BmO03Uyp8j8NV3To1GL2Bs+v82dCVbEBoU3KU0eoTPjhDNJO7plG4zffQff5GQefzfd9f9LVYV2j9Lc331fGwwER/F
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 Dec 2025 01:41:28 +0000
=E9=AB=98=E7=BF=94 <gaoxiang17@xiaomi.com> wrote:

> > there was some whitespace issues with the macro. =20
>=20
> I check the patch with checkpatch.pl, couldn't find whitespace issues.
>=20


> > +DECLARE_EVENT_CLASS(dma_buf,
> > +
> > +     TP_PROTO(struct dma_buf *dmabuf),
> > +
> > +     TP_ARGS(dmabuf),
> > +
> > +     TP_STRUCT__entry(
> > +             __string(exp_name, dmabuf->exp_name)
> > +             __field(size_t, size)
> > +             __field(ino_t, ino)
> > +     ),

These don't follow checkpatch recommendations for whitespace, because they
are "special". Please update these to look more like a structure:

     TP_STRUCT__entry(
             __string(	exp_name,		dmabuf->exp_name)
             __field(	size_t,			size)
             __field(	ino_t,			ino)
     ),


> > +
> > +     TP_fast_assign(
> > +             __assign_str(exp_name);
> > +             __entry->size =3D dmabuf->size;
> > +             __entry->ino =3D dmabuf->file->f_inode->i_ino;
> > +     ),
> > +
> > +     TP_printk("exp_name=3D%s size=3D%zu ino=3D%lu",
> > +               __get_str(exp_name),
> > +               __entry->size,
> > +               __entry->ino)
> > +);
> > +
> > +DECLARE_EVENT_CLASS(dma_buf_attach_dev,
> > +
> > +     TP_PROTO(struct dma_buf *dmabuf, struct dma_buf_attachment *attac=
h,
> > +             bool is_dynamic, struct device *dev),
> > +
> > +     TP_ARGS(dmabuf, attach, is_dynamic, dev),
> > +
> > +     TP_STRUCT__entry(
> > +             __string(dev_name, dev_name(dev))
> > +             __string(exp_name, dmabuf->exp_name)
> > +             __field(size_t, size)
> > +             __field(ino_t, ino)
> > +             __field(struct dma_buf_attachment *, attach)
> > +             __field(bool, is_dynamic)
> > +     ),

Same here too:

     TP_STRUCT__entry(
             __string(	dev_name,			dev_name(dev))
             __string(	exp_name,			dmabuf->exp_name)
             __field(	size_t,				size)
             __field(	ino_t,				ino)
             __field(	struct dma_buf_attachment *,	attach)
             __field(	bool,				is_dynamic)
     ),


> > +
> > +     TP_fast_assign(
> > +             __assign_str(dev_name);
> > +             __assign_str(exp_name);
> > +             __entry->size =3D dmabuf->size;
> > +             __entry->ino =3D dmabuf->file->f_inode->i_ino;
> > +             __entry->is_dynamic =3D is_dynamic;
> > +             __entry->attach =3D attach;
> > +     ),
> > +
> > +     TP_printk("exp_name=3D%s size=3D%zu ino=3D%lu attachment:%p is_dy=
namic=3D%d dev_name=3D%s",
> > +               __get_str(exp_name),
> > +               __entry->size,
> > +               __entry->ino,
> > +               __entry->attach,
> > +               __entry->is_dynamic,
> > +               __get_str(dev_name))
> > +);
> > +
> > +DECLARE_EVENT_CLASS(dma_buf_fd,
> > +
> > +     TP_PROTO(struct dma_buf *dmabuf, int fd),
> > +
> > +     TP_ARGS(dmabuf, fd),
> > +
> > +     TP_STRUCT__entry(
> > +             __string(exp_name, dmabuf->exp_name)
> > +             __field(size_t, size)
> > +             __field(ino_t, ino)
> > +             __field(int, fd)
> > +     ),

And the above.

-- Steve

> > +
> > +     TP_fast_assign(
> > +             __assign_str(exp_name);
> > +             __entry->size =3D dmabuf->size;
> > +             __entry->ino =3D dmabuf->file->f_inode->i_ino;
> > +             __entry->fd =3D fd;
> > +     ),
> > +
> > +     TP_printk("exp_name=3D%s size=3D%zu ino=3D%lu fd=3D%d",
> > +               __get_str(exp_name),
> > +               __entry->size,
> > +               __entry->ino,
> > +               __entry->fd)
> > +);
> > +
