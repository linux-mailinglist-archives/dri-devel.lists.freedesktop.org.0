Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4FE1B0E76
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 16:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF5289B33;
	Mon, 20 Apr 2020 14:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4483B89B33
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 14:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587393193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/BICmOxm1sDjBE0Fw16pReYLCBtQ7NAWk0hypsbt5YE=;
 b=bmnKa3ezmg3iI1DZKglhGQwcaUqqoKFPkyirnCM0wiPWofvL2/8XTfnhKKSjE+mQosu2Rt
 Xpc1rFgIYoVZKrD/z6J08LP+pZfYLCkUvCRqRkwlA/B1ZP4k+/bH8kpjoHcgGs+ms7/C7y
 70S5aLHgxpF9yoEc7Fy/WSHeit0ncEg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-Zy3AKphUNV68387UVBdKyg-1; Mon, 20 Apr 2020 10:33:11 -0400
X-MC-Unique: Zy3AKphUNV68387UVBdKyg-1
Received: by mail-wr1-f71.google.com with SMTP id p2so5037754wrx.12
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 07:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/BICmOxm1sDjBE0Fw16pReYLCBtQ7NAWk0hypsbt5YE=;
 b=TuwlZII6sfmuYA+EVo4Gu9WT5P2Hd/gIsDqAQb+Eq0hEcSR/uWDEgEpdEisBMSNO6H
 7lASNnVskCrokHnlQ3J+LzBPu5z1tobDaDyK9drHXak8GIG8BCr7ZrvhgT25fHFWSZN6
 R2xFWkURKjV45jZY3tGU1+TgF5aT0AzWkvMiZ88vooT6fhY9AFM5FMB0QxLQihJgX1bt
 MGVFyPkfDkjH75JFET+3pliNaAaFa/UM70WoFgHIHXOXQMrgQ1xumKkIcKSDuljsGP7o
 GZCTi34IMUFUKRQi+IqH+8p1/BBLNvGbM6I4anrYxh6jWoQkd8Z11vT4/TFooNYqAVin
 wJ9g==
X-Gm-Message-State: AGi0Pua51O9kctoZOeawt14eV9ABwm4mcNIlMxk7S6PNZaVFCoQbmnJR
 opq5e41S4dHhR4lJyiuETR10hF9u2NW7jrfuZKIv/LYUt72CPGhyVbLUAhVTuLV2ycpYa1tkZJ0
 YZC7uiYmogdxK8yYN6fX47VZ/Vrea
X-Received: by 2002:a5d:6689:: with SMTP id l9mr10607529wru.261.1587393190509; 
 Mon, 20 Apr 2020 07:33:10 -0700 (PDT)
X-Google-Smtp-Source: APiQypIE3DMH5xFDwGNUfVPw+X70x/SDiUNUfiLWd0azjzp9qQ2tZy+YP/738/NNIg43An+9cygOww==
X-Received: by 2002:a5d:6689:: with SMTP id l9mr10607487wru.261.1587393190204; 
 Mon, 20 Apr 2020 07:33:10 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:199a:e5ab:a38c:544c?
 ([2001:b07:6468:f312:199a:e5ab:a38c:544c])
 by smtp.gmail.com with ESMTPSA id l5sm1432000wrm.66.2020.04.20.07.33.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2020 07:33:09 -0700 (PDT)
Subject: Re: [PATCH 6/8] simplefs: add file creation functions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20200414124304.4470-1-eesposit@redhat.com>
 <20200414124304.4470-7-eesposit@redhat.com>
 <20200414125626.GC720679@kroah.com>
 <f371bcc0-266a-cb0b-3bde-fed336b8c9b5@redhat.com>
 <20200420142842.GA4125486@kroah.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7d7a9ccc-022d-f60d-d28a-f063ab9494bc@redhat.com>
Date: Mon, 20 Apr 2020 16:33:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200420142842.GA4125486@kroah.com>
Content-Language: en-US
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
Cc: Song Liu <songliubraving@fb.com>, linux-usb@vger.kernel.org,
 bpf@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@linux.ie>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org,
 "J. Bruce Fields" <bfields@fieldses.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Hugh Dickins <hughd@google.com>,
 Paul Mackerras <paulus@samba.org>, John Johansen <john.johansen@canonical.com>,
 netdev@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 Christoph Hellwig <hch@lst.de>, Andrew Donnellan <ajd@linux.ibm.com>,
 Matthew Garrett <matthew.garrett@nebula.com>, linux-efi@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Borkmann <daniel@iogearbox.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Mark Fasheh <mark@fasheh.com>,
 Anton Vorontsov <anton@enomsg.org>, John Fastabend <john.fastabend@gmail.com>,
 James Morris <jmorris@namei.org>, Ard Biesheuvel <ardb@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 oprofile-list@lists.sf.net, Yonghong Song <yhs@fb.com>,
 Ian Kent <raven@themaw.net>, Andrii Nakryiko <andriin@fb.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 Robert Richter <rric@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Tony Luck <tony.luck@intel.com>, Kees Cook <keescook@chromium.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, autofs@vger.kernel.org,
 Mike Marciniszyn <mike.marciniszyn@intel.com>, linux-fsdevel@vger.kernel.org,
 "Manoj N. Kumar" <manoj@linux.ibm.com>, Uma Krishnan <ukrishn@linux.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, KP Singh <kpsingh@chromium.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 "Matthew R. Ochs" <mrochs@linux.ibm.com>,
 "David S. Miller" <davem@davemloft.net>, Felipe Balbi <balbi@kernel.org>,
 linux-nfs@vger.kernel.org, Iurii Zaikin <yzaikin@google.com>,
 linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-mm@kvack.org, linux-s390@vger.kernel.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-security-module@vger.kernel.org,
 linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Jeremy Kerr <jk@ozlabs.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Colin Cross <ccross@android.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, Joel Becker <jlbec@evilplan.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/04/20 16:28, Greg Kroah-Hartman wrote:
>> I assume you meant a new file. These new functions are used only by a few
>> filesystems, and I didn't want to include them in vmlinux unconditionally,
>> so I introduced simplefs.c and CONFIG_SIMPLEFS instead of extending libfs.c.
>> In this way only fs that need this code like debugfs and tracefs will load
>> it.
> Nothing "loads it", why not just make these libfs functions instead?  As
> the difference between the two is not obvious at all, please don't make
> things confusing.

I think Emanuele meant "will link it" not "will load it".

Emanuele, you can just move everything to libfs.c and get rid of
CONFIG_SIMPLEFS too.  "Do less" is not an offer you want to turn down!

Thanks,

Paolo

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
