Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69117141272
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 21:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A12D6F914;
	Fri, 17 Jan 2020 20:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91096F914
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 20:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579293932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b9UtGNfD9714SZL8iiH6wa7e0RDh+4SCb7LDHbL19gs=;
 b=XNpvdjJcN/PkzTrk9q/ItJhieJ6vRU9h9poXgatNzv3ZssE+bgFSQ+Je0hWCLzGwfI9Trn
 PAt4HJnZVE96unJAQBPhosKMBTiJa86jRjGdivqN+cIhsPHHsHx1DezgQXk6ATTIaVammh
 smvd38JrLhgFNCG9PCasqvZn4bs7ngw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-me1kojN_O0SwpQIa8SWIRA-1; Fri, 17 Jan 2020 15:45:31 -0500
Received: by mail-qt1-f199.google.com with SMTP id t4so16771020qtd.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 12:45:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=b9UtGNfD9714SZL8iiH6wa7e0RDh+4SCb7LDHbL19gs=;
 b=gjyEgxAvVOUYDrEUw2O7geTZfN4dXINxkE87NWCgoKeoa4MS7DmcYhRa3vP08Fakj2
 PLFAVv0fhtKWMjzYyg6ZFZK2IjPaUtXbYYaIgOeLpqEfpzKHrwFknRDQ4XAhJEvnh1eJ
 P/6twzYrlcEFx5/QGuZlyCVZva2CcXdGSUIKpF++Tiy81yU4JIEWExjROJSwQWAmEBx7
 Tb1VZZdHdWDpJVcl43mJnAlBR7ayxlJ2Sc4vraE8ZDYf2ftogMXtvV+K/fAeNXpHRckh
 3Yg2vUYJi7KK4yOib9yTKYg/xDESVfG+GlEzFCf7USQsjY0s0KTmUlBF29aAnqS44PWb
 XERg==
X-Gm-Message-State: APjAAAVNTjPn/6EwblI7I6xVy/fCjXGgltiWTUiP3rpR4jWzEom3PsZu
 QzeYqpb0GuFdPzIEa7SveJKnEHlwnMxAu7N6BJq1AtrMOxr98ypLg0ktvjcrBYOPY64wv839KyM
 CehKO2OvBe7J6YlnjdcijxilYUNAU
X-Received: by 2002:a05:620a:849:: with SMTP id
 u9mr40542366qku.414.1579293930791; 
 Fri, 17 Jan 2020 12:45:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqzm/epyHbhox0dOOjWR6cniA2F6Xix11eqF5HHeDcHB2CLPPeLs9GN2puOuNQjMJ5WcdKj0YA==
X-Received: by 2002:a05:620a:849:: with SMTP id
 u9mr40542346qku.414.1579293930540; 
 Fri, 17 Jan 2020 12:45:30 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id n32sm13469727qtk.66.2020.01.17.12.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 12:45:29 -0800 (PST)
Message-ID: <cfae7fec779bd8fa4da0ad0e7664cf797a1700ab.camel@redhat.com>
Subject: Re: [PATCH v2] drm/dp_mst: Remove VCPI while disabling topology mgr
From: Lyude Paul <lyude@redhat.com>
To: Sean Paul <sean@poorly.run>
Date: Fri, 17 Jan 2020 15:45:28 -0500
In-Reply-To: <CAMavQK+pOtQ62mp4DSRDW7nHDz4doW3LA5AV1NML-wFa3s3cQA@mail.gmail.com>
References: <20191205090043.7580-1-Wayne.Lin@amd.com>
 <a6c4db964da7e00a6069d40abcb3aa887ef5522b.camel@redhat.com>
 <ec3e020798d99ce638c05b0f3eb00ebf53c3bd7c.camel@redhat.com>
 <DM6PR12MB41371AC4B0EC24E84AB0C84DFC580@DM6PR12MB4137.namprd12.prod.outlook.com>
 <CAMavQK+pS40SQibFuirjLAmjmy8NbOcXWvNsFP8PanS6dEcXWw@mail.gmail.com>
 <31d9eabe57a25ff8f4df22e645494d57715cdc0b.camel@redhat.com>
 <CAMavQK+pOtQ62mp4DSRDW7nHDz4doW3LA5AV1NML-wFa3s3cQA@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31)
MIME-Version: 1.0
X-MC-Unique: me1kojN_O0SwpQIa8SWIRA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
 "stable@vger.kernel.org" <stable@vger.kernel.org>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Lin,
 Wayne" <Wayne.Lin@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yeah that's fine with me, I'll send out a revert for this in just a moment

On Fri, 2020-01-17 at 15:43 -0500, Sean Paul wrote:
> On Fri, Jan 17, 2020 at 3:27 PM Lyude Paul <lyude@redhat.com> wrote:
> > On Fri, 2020-01-17 at 11:19 -0500, Sean Paul wrote:
> > > On Mon, Dec 9, 2019 at 12:56 AM Lin, Wayne <Wayne.Lin@amd.com> wrote:
> > > > 
> > > > > -----Original Message-----
> > > > > From: Lyude Paul <lyude@redhat.com>
> > > > > Sent: Saturday, December 7, 2019 3:57 AM
> > > > > To: Lin, Wayne <Wayne.Lin@amd.com>; dri-devel@lists.freedesktop.org;
> > > > > amd-gfx@lists.freedesktop.org
> > > > > Cc: Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Wentland,
> > > > > Harry
> > > > > <Harry.Wentland@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>;
> > > > > stable@vger.kernel.org
> > > > > Subject: Re: [PATCH v2] drm/dp_mst: Remove VCPI while disabling
> > > > > topology
> > > > > mgr
> > > > > 
> > > > > On Fri, 2019-12-06 at 14:24 -0500, Lyude Paul wrote:
> > > > > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > > > > 
> > > > > > I'll go ahead and push this to drm-misc-next-fixes right now,
> > > > > > thanks!
> > > > > 
> > > > > Whoops-meant to say drm-misc-next here, anyway, pushed!
> > > > Thanks for your time!
> > > > 
> > > 
> > > I'm getting the following warning on unplug with this patch:
> > > 
> 
> \snip
> 
> > I think I've got a better fix for this that should avoid that problem,
> > I'll
> > write up a patch and send it out in a bit
> 
> Thanks Lyude! Should we revert this patch for the time being?
> 
> > --
> > Cheers,
> >         Lyude Paul
> > 
-- 
Cheers,
	Lyude Paul

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
