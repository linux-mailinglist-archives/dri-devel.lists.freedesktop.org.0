Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF031B0D8C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 15:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2982B6E581;
	Mon, 20 Apr 2020 13:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7110C6E58A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 13:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587391089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xUgf1dELTVkqbl5oz8lk6XQ7zC/RuDwFip+M0efFdJc=;
 b=fezp4UcnLOiAwNGjQ4oX63tLk2wtJmc/lUJKIWGuww8wBoQy59I5YcvzlgWs1QRTxJYK4L
 RQi1qkuIPQoJ4PdOTCK+AJWtDrq5bEV0WD1kszf0CVst92cloFucf3d7ZUIrV2+mqyk8V6
 +m8tv/U8+XhXPaBJg1pmKBZc/SDKS44=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-7Kbyt8hfMzeHyUjvZvNo3g-1; Mon, 20 Apr 2020 09:58:07 -0400
X-MC-Unique: 7Kbyt8hfMzeHyUjvZvNo3g-1
Received: by mail-wm1-f71.google.com with SMTP id v185so3532388wmg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 06:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xUgf1dELTVkqbl5oz8lk6XQ7zC/RuDwFip+M0efFdJc=;
 b=OrxzHDpyJhplh7kFylH6cA/L4VST6hXB0qbnNJ3ft9iE3/6VQ/qdJP81RS/1E638Ug
 yNEFznflXKD4sJeb4Ge28BIMUissdq2BW6t9U6Hbx+Rvl+KT1/ehhnjiMQXqgReUWE+X
 4NpN/9oSezGx8I+BWpLzsHP60I0gehMEJ4ZL7zKjLbmTeM3r+/CVSmfTKg0HK76IuMVr
 7zGnjX9KboN5woLRH4A2/K+pJ3i4jnrnnlJJjQVPomheDu9PANrB+S9WKjfOTcnTMtpG
 Yp9dySW9glvCuKDBviYl6OTNcTbpLPZLgAdHt27YnbUwlaDTUohjTeQPq6p+lSegeM94
 vGBA==
X-Gm-Message-State: AGi0Pub6sYV8mMYvieWiIrYqi4FcpJm5LraZyJgGrWDXuRG6MrvEuYdW
 kQ2fvjqX5zbXIeA+q8L4fA929OzBTspTN2M8LKEaHbC7vy++KVmd+vo9CyELZye9umSqy4gs4FT
 VucRDsDLjK4+fCFq60k4rwNw5kMSx
X-Received: by 2002:adf:f343:: with SMTP id e3mr18182959wrp.51.1587391086586; 
 Mon, 20 Apr 2020 06:58:06 -0700 (PDT)
X-Google-Smtp-Source: APiQypKgfh4+u4HEj4PPYW/XSZ46PCQmhZFzPWrmjnxffDGdhSBfk7/303BzRADycOzBMc3ansohTA==
X-Received: by 2002:adf:f343:: with SMTP id e3mr18182928wrp.51.1587391086383; 
 Mon, 20 Apr 2020 06:58:06 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.102])
 by smtp.gmail.com with ESMTPSA id y18sm1584636wmc.45.2020.04.20.06.58.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2020 06:58:05 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 4/8] fs: introduce simple_new_inode
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200414124304.4470-1-eesposit@redhat.com>
 <20200414124304.4470-5-eesposit@redhat.com>
 <20200414130140.GD720679@kroah.com>
Message-ID: <e87e032e-32cf-a6fc-af8f-3bcece2fcff7@redhat.com>
Date: Mon, 20 Apr 2020 15:58:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200414130140.GD720679@kroah.com>
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
 Robert Richter <rric@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Vasily Gorbik <gor@linux.ibm.com>, Tony Luck <tony.luck@intel.com>,
 Kees Cook <keescook@chromium.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 autofs@vger.kernel.org, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 linux-fsdevel@vger.kernel.org, "Manoj N. Kumar" <manoj@linux.ibm.com>,
 Uma Krishnan <ukrishn@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>,
 KP Singh <kpsingh@chromium.org>,
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
 Jeremy Kerr <jk@ozlabs.org>, Colin Cross <ccross@android.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, Joel Becker <jlbec@evilplan.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/14/20 3:01 PM, Greg Kroah-Hartman wrote:
> On Tue, Apr 14, 2020 at 02:42:58PM +0200, Emanuele Giuseppe Esposito wrote:
>> It is a common special case for new_inode to initialize the
>> time to the current time and the inode to get_next_ino().
>> Introduce a core function that does it and use it throughout
>> Linux.
> 
> Shouldn't this just be called new_inode_current_time()?
> 
> How is anyone going to remember what simple_new_inode() does to the
> inode structure?

I noticed that most functions in libfs.c are called "simple_*" when they 
do the right thing for the majority of simple use cases (e.g., 
simple_symlink_inode_operations or simple_dir_operations). I can 
certainly rename the function.

Thank you for all the feedback, I will incorporate it and send a new 
patch series soon.


Emanuele
> 
>> --- a/fs/libfs.c
>> +++ b/fs/libfs.c
>> @@ -595,6 +595,18 @@ int simple_write_end(struct file *file, struct address_space *mapping,
>>   }
>>   EXPORT_SYMBOL(simple_write_end);
>>   
>> +struct inode *simple_new_inode(struct super_block *sb)
>> +{
>> +	struct inode *inode = new_inode(sb);
>> +	if (inode) {
>> +		inode->i_ino = get_next_ino();
>> +		inode->i_atime = inode->i_mtime =
>> +			inode->i_ctime = current_time(inode);
>> +	}
>> +	return inode;
>> +}
>> +EXPORT_SYMBOL(simple_new_inode);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
