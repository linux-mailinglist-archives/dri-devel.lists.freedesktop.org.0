Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1B31B0D9D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 16:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6976E58A;
	Mon, 20 Apr 2020 14:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001C86E58A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 14:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587391277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CRCdhBzjtov7RvcoLcOwUA5fYrO6qOb+mWbouXaiL5k=;
 b=fY2LJP82b0mA0vso6+vcqqdyQj2JpD112nTAJEGNfUpNAdbBe+i85z3rpxxALtKH4pm5Hy
 /OjtPoxC8rxvXA570yuO26k+VScdVpVnKqORC87b9oMhf8XqlH7yiEVm9qkOrfmiKYZjPP
 p37PDcwSI1a+2VokulA0+eKYJOuZpqo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-U4TlAGbhPkqaHlO7Vyk-8Q-1; Mon, 20 Apr 2020 10:01:15 -0400
X-MC-Unique: U4TlAGbhPkqaHlO7Vyk-8Q-1
Received: by mail-wr1-f72.google.com with SMTP id p2so4992179wrx.12
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 07:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CRCdhBzjtov7RvcoLcOwUA5fYrO6qOb+mWbouXaiL5k=;
 b=AfDRQVrEAglnJ+XLanPMM0jnZBaba+1E8qdSSRmV/VIHYUgFFxulADbeakUdfRvsig
 IvR0HQcrmdo27kETCZ8Re97PRLn+jET2cITw1DNvUn/6Zgfkv/ddejRaAyJtAIGd/wI0
 xprN+SXQy+jl6WME6Pr0MlEiA/MeUQ1Nxy/Jo2nFs/JcBJUqdjRRUNaJTCgiN2ZzDqap
 egr+b+1y48ez4AJBoWzOIVNyHavEONZ3qb9LsXWBi4VOp5fWD4E9wPU2sfn9uy8nTXeB
 A9B9NIhdb2ed79W7MHrraoA6HUcxZ3N/mV2V9v5lF1tH7X4Fl8aTbn8yKt+ItNsmgTzp
 ZV4A==
X-Gm-Message-State: AGi0PuZqjIC0pp3MmDdAV58Il/voCaT0G8wP/8s0ta5EN05opAmwcv+x
 8E/PfC6zKtV5ItayYkkDDSFbS9AAbBGKBGhP48Mc+7t94I5QGWCA36iwhLJqXBlAMZ1zLsbbKvM
 txEmyorcqVLop9KzdZnb//OnPP6/Z
X-Received: by 2002:adf:dd8f:: with SMTP id x15mr20314171wrl.201.1587391274302; 
 Mon, 20 Apr 2020 07:01:14 -0700 (PDT)
X-Google-Smtp-Source: APiQypKPnHC5LPyU8TDLr76kncprhTGb3bGNWjc4FM2HGpGEeoX6O6gIYtgQcBPwl5xg+T4TCSCY0A==
X-Received: by 2002:adf:dd8f:: with SMTP id x15mr20314132wrl.201.1587391274111; 
 Mon, 20 Apr 2020 07:01:14 -0700 (PDT)
Received: from localhost.localdomain ([194.230.155.102])
 by smtp.gmail.com with ESMTPSA id q17sm1265501wmj.45.2020.04.20.07.01.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2020 07:01:13 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH 0/8] Simplefs: group and simplify linux fs code
To: Luis Chamberlain <mcgrof@kernel.org>
References: <20200414124304.4470-1-eesposit@redhat.com>
 <20200416065922.GS11244@42.do-not-panic.com>
Message-ID: <79e3dd06-7cea-7798-42a2-596c185abd7b@redhat.com>
Date: Mon, 20 Apr 2020 16:01:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200416065922.GS11244@42.do-not-panic.com>
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
 linux-s390@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Matthew Garrett <matthew.garrett@nebula.com>, linux-efi@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Borkmann <daniel@iogearbox.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Mark Fasheh <mark@fasheh.com>,
 Anton Vorontsov <anton@enomsg.org>, John Fastabend <john.fastabend@gmail.com>,
 James Morris <jmorris@namei.org>, Ard Biesheuvel <ardb@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>,
 Yonghong Song <yhs@fb.com>, Ian Kent <raven@themaw.net>,
 Andrii Nakryiko <andriin@fb.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, netdev@vger.kernel.org,
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
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-kernel@vger.kernel.org,
 Anna Schumaker <anna.schumaker@netapp.com>,
 linux-security-module@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>,
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



On 4/16/20 8:59 AM, Luis Chamberlain wrote:
> On Tue, Apr 14, 2020 at 02:42:54PM +0200, Emanuele Giuseppe Esposito wrote:
>> This series of patches introduce wrappers for functions,
>> arguments simplification in functions calls and most importantly
>> groups duplicated code in a single header, simplefs, to avoid redundancy
>> in the linux fs, especially debugfs and tracefs.
> 
> The general goal seems worthy, but here I don't see explained why hasn't
> this gone through libfs, and what the intention was long term. For
> instance, you added some other generalizations which you have found. It
> was not clear that this was the goal here, to expand on these paths.
> 
> What if common code on fs is found which are not part of debugfs and
> tracefs, how does one decide if to move to libfs or simplefs?

The idea of simplefs (that I will also explain better in the cover 
letter and commit messages) is that not only it groups common code, but 
also introduces a new struct simple_fs that simplifies parameter 
passing. This means all fs that use these functions and the struct 
should include linux/simplefs.h, while all common functions that take a 
simple_fs struct will be added in simplefs.c

Thank you for all the feedback, I will incorporate it and send a new 
patch series soon.

Emanuele

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
