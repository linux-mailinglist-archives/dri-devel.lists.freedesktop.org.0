Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 300948BC882
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 09:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFBC1121C4;
	Mon,  6 May 2024 07:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qws6mukj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0517F10EA3C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 11:54:30 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-6eb93ec8804so5020692a34.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 04:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714737270; x=1715342070; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=v9RNLcQN3p6zT0UsH7fQCtkFK7ZrktPHW9/cBp7YLVw=;
 b=Qws6mukjRbaIyRMwfRx4kUXc6ZPpDiVazErbXu16kOeUhOO9XAR1Aj3BFKTdcvqm8q
 si3dr/QAudI24RrKWBg6AU+zycDry68TmKiFuguOetaj9eh/uaWR0s+Xfoa7C05Nvw16
 q6s5Aq/TAHu0DeR2KEmfsuQV+GKqPSc/FnCtNBfNe6/zRJ3DA97AKDLDfZ3LSgbhyDes
 e3J7psXCXAktci6K/LaOTgHqftrW13uDFSIlSNjvBVe2bIDQBJe8r9DGpfJ10QskAGkX
 HQnBRJX1mpiqTUx8iZCYHwj8CEShcugUXWJxYKqeZCv/N+k9OztYYpnKPpm91meecvR3
 JzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714737270; x=1715342070;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v9RNLcQN3p6zT0UsH7fQCtkFK7ZrktPHW9/cBp7YLVw=;
 b=VXBmwbueUBgMnx98Q0OXl/Wdc8upLmHyjItGNKLHDt/6gm3hQ5uQSNuJ8xzF7r/0UH
 utiOsYMj43t3a5pPYEUi+AmOLIc1fayrPKBXSBRZiZYEXBxrpvYsT3vTWs/fVl5dGJdN
 SbleTewWzMz98KzbxImXuqNPE8WW2j+2SFZf4tGVFMSu/Bp+bQsSIjgQJWWiB7oOdi5G
 ynPXc6O4hwt06Pu3B4G4yObENZzGGJCXx2lOWUMJeroV5UgWw7rAaHvoGhVvNMqTLmCC
 oPeDlD9rlR2sDYxss5npkrfTPUwlvhRBkbWMWWyhn1sng0/8IMlrAXP/UMgd71KQmv5W
 Z9fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVClUIkrM7cAY4rY50mdoEMqI83hy/9GkQI8P7bxSJUmASJ5VgFla9yFqTjPsesHBJ2I2BhpS2xdLcP/e10XkPJ3Jd3q0iV4Pwf6nJhoRKC
X-Gm-Message-State: AOJu0Yzy7WKI/Qx9CDhWkfbsbDqyeHI48VKprSDdUYfRq76+65HUXdTK
 LfI7CEsB8z/GI456Z0tZkavYW14v0wWM59jozA7Jsf0FadG3s3W65f+4IQ==
X-Google-Smtp-Source: AGHT+IEUb71YrMo7ELiUmyY02B7z0Sr4II89eurwWz96Ln1/3LjWRswdXxe5x6bFZ4CPTVEtfwhGaw==
X-Received: by 2002:a05:6870:46a3:b0:22a:4c6a:39ea with SMTP id
 a35-20020a05687046a300b0022a4c6a39eamr2906165oap.14.1714737269733; 
 Fri, 03 May 2024 04:54:29 -0700 (PDT)
Received: from ?IPV6:2001:ee0:50f5:a230:db34:1b4d:d1d7:db98?
 ([2001:ee0:50f5:a230:db34:1b4d:d1d7:db98])
 by smtp.gmail.com with ESMTPSA id
 b185-20020a6334c2000000b0061f42afa8d0sm90331pga.6.2024.05.03.04.54.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 04:54:29 -0700 (PDT)
Message-ID: <7c41cf3c-2a71-4dbb-8f34-0337890906fc@gmail.com>
Date: Fri, 3 May 2024 18:54:22 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [fs?] [io-uring?] general protection fault in __ep_remove
To: syzbot <syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com>,
 axboe@kernel.dk, brauner@kernel.org, io-uring@vger.kernel.org, jack@suse.cz,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
References: <0000000000002d631f0615918f1e@google.com>
Content-Language: en-US
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Laura Abbott <laura@labbott.name>, Kees Cook <keescook@chromium.org>
From: Bui Quang Minh <minhquangbui99@gmail.com>
In-Reply-To: <0000000000002d631f0615918f1e@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 06 May 2024 07:44:23 +0000
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

Hi everyone,

I've tried to debug this syzkaller's bug report

Here is my minimized proof-of-concept

#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <sys/epoll.h>
#include <linux/udmabuf.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <pthread.h>
#include <sys/ioctl.h>

#define err_msg(msg) do {perror(msg); exit(1);} while(0)

void *close_thread(void *arg)
{
     int fd = (int) (long) arg;
     close(fd);
}

int main()
{
     int fd, dmabuf_fd, memfd, epoll_fd, ret;
     struct udmabuf_create dmabuf_arg = {};
     struct epoll_event event = {
         .events = EPOLLIN | EPOLLOUT,
     };
     pthread_t thread;

     memfd = memfd_create("test", MFD_ALLOW_SEALING);
     if (memfd < 0)
         err_msg("memfd-create");

     if (ftruncate(memfd, 0x1000) < 0)
         err_msg("ftruncate");

     ret = fcntl(memfd, F_ADD_SEALS, F_SEAL_SHRINK);
     if (ret < 0)
         err_msg("add-seal");

     fd = open("/dev/udmabuf", O_RDWR);
     if (fd < 0)
         err_msg("open");

     dmabuf_arg.memfd = memfd;
     dmabuf_arg.size = 0x1000;
     dmabuf_fd = ioctl(fd, UDMABUF_CREATE, &dmabuf_arg);
     if (dmabuf_fd < 0)
         err_msg("ioctl-udmabuf");

     epoll_fd = epoll_create(10);
     if (epoll_fd < 0)
         err_msg("epoll-create");

     ret = epoll_ctl(epoll_fd, EPOLL_CTL_ADD, dmabuf_fd, &event);
     if (ret < 0)
         err_msg("epoll-ctl-add");

     pthread_create(&thread, NULL, close_thread, (void *) (long) dmabuf_fd);
     epoll_wait(epoll_fd, &event, 1, -1);
     return 0;
}

When running the above proof-of-concept on Linux 6.9.0-rc6 with KASAN 
and the
following patch for easier reproducible, I got the KASAN bug report

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 8fe5aa67b167..de3463e7d47b 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -27,6 +27,7 @@
  #include <linux/mm.h>
  #include <linux/mount.h>
  #include <linux/pseudo_fs.h>
+#include <linux/delay.h>

  #include <uapi/linux/dma-buf.h>
  #include <uapi/linux/magic.h>
@@ -240,6 +241,7 @@ static __poll_t dma_buf_poll(struct file *file, 
poll_table *poll)
         struct dma_resv *resv;
         __poll_t events;

+       mdelay(1000);
         dmabuf = file->private_data;
         if (!dmabuf || !dmabuf->resv)
                 return EPOLLERR;

 > while true; do ./mypoc_v2; done
==================================================================
BUG: KASAN: slab-use-after-free in __fput+0x164/0x523
Read of size 8 at addr ffff88800051e830 by task mypoc_v2/402

CPU: 0 PID: 402 Comm: mypoc_v2 Not tainted 6.9.0-rc5+ #11
Call Trace:
  <TASK>
  dump_stack_lvl+0x49/0x65
  ? __fput+0x164/0x523
  print_report+0x170/0x4c2
  ? __virt_addr_valid+0x21b/0x22c
  ? kmem_cache_debug_flags+0xc/0x1d
  ? __fput+0x164/0x523
  kasan_report+0xae/0xd5
  ? __fput+0x164/0x523
  __fput+0x164/0x523
  ? __pfx___schedule+0x10/0x10
  task_work_run+0x16a/0x1bb
  ? __pfx_task_work_run+0x10/0x10
  ? __x64_sys_epoll_wait+0x107/0x143
  resume_user_mode_work+0x21/0x44
  syscall_exit_to_user_mode+0x5d/0x76
  do_syscall_64+0xb5/0x107
  entry_SYSCALL_64_after_hwframe+0x76/0x7e
RIP: 0033:0x44d99e
Code: 10 89 7c 24 0c 89 4c 24 1c e8 2e 8c 02 00 44 8b 54 24 1c 8b 54 24 
18 41 89 c0 48 8b 74 24 10 8b 7c 24 0c b8 e8 00 00 00 0f 05 <48> 3d 00 
f0 ff ff 77 32 44 89 c7 89 44 24 0c e8 6e 8c 02 00 8b 44
RSP: 002b:00007fffaec21770 EFLAGS: 00000293 ORIG_RAX: 00000000000000e8
RAX: 0000000000000001 RBX: 00007fffaec219e8 RCX: 000000000044d99e
RDX: 0000000000000001 RSI: 00007fffaec217c4 RDI: 0000000000000006
RBP: 00007fffaec217f0 R08: 0000000000000000 R09: 00007fffaec2167f
R10: 00000000ffffffff R11: 0000000000000293 R12: 0000000000000001
R13: 00007fffaec219d8 R14: 00000000004dc790 R15: 0000000000000001
  </TASK>

Allocated by task 402:
  kasan_save_stack+0x24/0x44
  kasan_save_track+0x14/0x2d
  __kasan_slab_alloc+0x47/0x55
  kmem_cache_alloc_lru+0x12a/0x172
  __d_alloc+0x2d/0x618
  d_alloc_pseudo+0x14/0x8d
  alloc_path_pseudo+0xa5/0x165
  alloc_file_pseudo+0x7f/0x124
  dma_buf_export+0x37f/0x894
  udmabuf_create+0x53e/0x68c
  udmabuf_ioctl+0x133/0x212
  vfs_ioctl+0x7e/0x95
  __do_sys_ioctl+0x51/0x78
  do_syscall_64+0x9b/0x107
  entry_SYSCALL_64_after_hwframe+0x76/0x7e

Freed by task 403:
  kasan_save_stack+0x24/0x44
  kasan_save_track+0x14/0x2d
  kasan_save_free_info+0x3f/0x4d
  poison_slab_object+0xcb/0xd8
  __kasan_slab_free+0x19/0x38
  kmem_cache_free+0xd6/0x136
  __dentry_kill+0x22d/0x321
  dput+0x3b/0x7f
  __fput+0x4f1/0x523
  __do_sys_close+0x59/0x87
  do_syscall_64+0x9b/0x107
  entry_SYSCALL_64_after_hwframe+0x76/0x7e

The buggy address belongs to the object at ffff88800051e800
  which belongs to the cache dentry of size 192
The buggy address is located 48 bytes inside of
  freed 192-byte region [ffff88800051e800, ffff88800051e8c0)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x51e
flags: 0x800(slab|zone=0)
page_type: 0xffffffff()
raw: 0000000000000800 ffff888000281780 ffffea0000013ec0 0000000000000002
raw: 0000000000000000 0000000080100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff88800051e700: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  ffff88800051e780: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
 >ffff88800051e800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                      ^
  ffff88800051e880: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
  ffff88800051e900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================

Root cause:
AFAIK, eventpoll (epoll) does not increase the registered file's reference.
To ensure the safety, when the registered file is deallocated in __fput,
eventpoll_release is called to unregister the file from epoll. When calling
poll on epoll, epoll will loop through registered files and call vfs_poll on
these files. In the file's poll, file is guaranteed to be alive, however, as
epoll does not increase the registered file's reference, the file may be 
dying
and it's not safe the get the file for later use. And dma_buf_poll violates
this. In the dma_buf_poll, it tries to get_file to use in the callback. This
leads to a race where the dmabuf->file can be fput twice.

Here is the race occurs in the above proof-of-concept

close(dmabuf->file)
__fput_sync (f_count == 1, last ref)
f_count-- (f_count == 0 now)
__fput
                                     epoll_wait
                                     vfs_poll(dmabuf->file)
                                     get_file(dmabuf->file)(f_count == 1)
eventpoll_release
dmabuf->file deallocation
                                     fput(dmabuf->file) (f_count == 1)
                                     f_count--
                                     dmabuf->file deallocation

I am not familiar with the dma_buf so I don't know the proper fix for the
issue. About the rule that don't get the file for later use in poll 
callback of
file, I wonder if it is there when only select/poll exist or just after 
epoll
appears.

I hope the analysis helps us to fix the issue.

Thanks,
Quang Minh.
