Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAC6898FD1
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 22:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D595210E4A6;
	Thu,  4 Apr 2024 20:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N9T3uRK5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEE710E4A6
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 20:53:40 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-7c8e4c0412dso15523139f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Apr 2024 13:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1712264019; x=1712868819;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b6haysz2jj5zoS/lj04ngNFWrnAh1M1xOR4nKflEgjw=;
 b=N9T3uRK5Pwbfcox4khIr1vJ4cmOyNh0Co+BmbCYM7PgoLoDLBXEuoHfYzmCwF0nIVV
 +6AODvNZ1B+Kujlqh4/kjtGYcZ3pog8iAH4+2Zl/YBP5LNqbiZfD7YaQkMo6q4tAul4k
 Kwqscz8wT3Uy8w52F9nwM2GoSD5BgzGhZCKbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712264019; x=1712868819;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b6haysz2jj5zoS/lj04ngNFWrnAh1M1xOR4nKflEgjw=;
 b=KdHxyWO8JG9g2YV83lDm9DT3nuUY99BRcfRvESOAUxYPCOXalHDPK/8wWPI+cvxa74
 AH9aGnqhVybdGG+TYbd/fI9NjhkSiL3NCqUcNdp8xos1O4MVYvTw7GQQt7pvjgGPz/As
 QIy71yEncjRIHo2rYEljIrOUnU1g/+iJHRLLOjOYfMFXWt/U6ZW8DebGlRKJvcrPeea9
 pCTOQcxgaQJVngT9enFXTuPiYfiwgiKcfcfA9YyPuLMFL7pHMLW+PTkT+KgtUMj+QEKK
 udHi/9dWaAycUoe7UdkkdC7GnnUq2lO+JS0cKQmsJ6bb74kZ7iSAxy9Gd89L2eyGnmTo
 DmdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn/LDoUUFPhlzRWZQOmXVRdW6RksJFjbHYkD4mJZdZJPRg+RbPgbmLsG+Ie2cA2ERQe43iX7BmS6gzTVZl4ZuHJfZkNPQmQDyGqtuoYfmg
X-Gm-Message-State: AOJu0Ywu9mOiPRkQDVq3CNii97qALZafMtjBHs88T6j6k/3dUP6CRLKf
 HgXGbfnmlfzCVbQtb/dOSZI39OPRB2F9kaDYPIlysJFq1ELeH02JsdQrZ7HQSdM=
X-Google-Smtp-Source: AGHT+IHM62tDkeD+s5T/EjpX9tVPyfcO4WL9ubUNV6KA18O2+poZa9JP0z632EkH0U2OvZlzgy3EpQ==
X-Received: by 2002:a5e:c20d:0:b0:7d3:5401:e4c with SMTP id
 v13-20020a5ec20d000000b007d354010e4cmr2863766iop.1.1712264019220; 
 Thu, 04 Apr 2024 13:53:39 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a056638319300b004773b943137sm105296jak.160.2024.04.04.13.53.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 13:53:38 -0700 (PDT)
Message-ID: <10495292-caa8-49ec-8909-52d3f1467627@linuxfoundation.org>
Date: Thu, 4 Apr 2024 14:53:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 8/8] selftests/udmabuf: Add tests to verify data after
 page migration
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Cc: Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Mike Kravetz <mike.kravetz@oracle.com>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 Junxiao Chang <junxiao.chang@intel.com>,
 Shuah Khan <skhan@linuxfoundation.org>, linu-kselftest@vger.kernel.org
References: <20240404073053.3073706-1-vivek.kasireddy@intel.com>
 <20240404073053.3073706-9-vivek.kasireddy@intel.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240404073053.3073706-9-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 4/4/24 01:26, Vivek Kasireddy wrote:
> Since the memfd pages associated with a udmabuf may be migrated
> as part of udmabuf create, we need to verify the data coherency
> after successful migration. The new tests added in this patch try
> to do just that using 4k sized pages and also 2 MB sized huge
> pages for the memfd.
> 
> Successful completion of the tests would mean that there is no
> disconnect between the memfd pages and the ones associated with
> a udmabuf. And, these tests can also be augmented in the future
> to test newer udmabuf features (such as handling memfd hole punch).
> 
> The idea for these tests comes from a patch by Mike Kravetz.

Add Suggested-by for Mike Kravetz

> 
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> Cc: Hugh Dickins <hughd@google.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dongwon Kim <dongwon.kim@intel.com>
> Cc: Junxiao Chang <junxiao.chang@intel.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>   .../selftests/drivers/dma-buf/udmabuf.c       | 151 +++++++++++++++++-
>   1 file changed, 147 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/drivers/dma-buf/udmabuf.c b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
> index c812080e304e..d76c813fe652 100644
> --- a/tools/testing/selftests/drivers/dma-buf/udmabuf.c
> +++ b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
> @@ -9,26 +9,132 @@
>   #include <errno.h>
>   #include <fcntl.h>
>   #include <malloc.h>
> +#include <stdbool.h>
>   
>   #include <sys/ioctl.h>
>   #include <sys/syscall.h>
> +#include <sys/mman.h>
>   #include <linux/memfd.h>
>   #include <linux/udmabuf.h>
>   
>   #define TEST_PREFIX	"drivers/dma-buf/udmabuf"
>   #define NUM_PAGES       4
> +#define NUM_ENTRIES     4
> +#define MEMFD_SIZE      1024 /* in pages */
>   
> -static int memfd_create(const char *name, unsigned int flags)
> +static unsigned int page_size;
> +
> +static int create_memfd_with_seals(off64_t size, bool hpage)
> +{
> +	int memfd, ret;
> +	unsigned int flags = MFD_ALLOW_SEALING;
> +
> +	if (hpage)
> +		flags |= MFD_HUGETLB;
> +
> +	memfd = memfd_create("udmabuf-test", flags);
> +	if (memfd < 0) {
> +		printf("%s: [skip,no-memfd]\n", TEST_PREFIX);
> +		exit(77);
> +	}
> +
> +	ret = fcntl(memfd, F_ADD_SEALS, F_SEAL_SHRINK);
> +	if (ret < 0) {
> +		printf("%s: [skip,fcntl-add-seals]\n", TEST_PREFIX);

Use the kselftest skip code here. Also use kselftest_* functions
to print results and exit messages for KTAP format.

> +		exit(77);

This should be KSFT_SKIP

> +	}
> +
> +	ret = ftruncate(memfd, size);
> +	if (ret == -1) {
> +		printf("%s: [FAIL,memfd-truncate]\n", TEST_PREFIX);
> +		exit(1);

Use KSFT_FAIL

> +	}
> +
> +	return memfd;
> +}
> +
> +static int create_udmabuf_list(int devfd, int memfd, off64_t memfd_size)
> +{
> +	struct udmabuf_create_list *list;
> +	int ubuf_fd, i;
> +
> +	list = malloc(sizeof(struct udmabuf_create_list) +
> +		      sizeof(struct udmabuf_create_item) * NUM_ENTRIES);
> +	if (!list) {
> +		printf("%s: [FAIL, udmabuf-malloc]\n", TEST_PREFIX);
> +		exit(1);
> +	}
> +
> +	for (i = 0; i < NUM_ENTRIES; i++) {
> +		list->list[i].memfd  = memfd;
> +		list->list[i].offset = i * (memfd_size / NUM_ENTRIES);
> +		list->list[i].size   = getpagesize() * NUM_PAGES;
> +	}
> +
> +	list->count = NUM_ENTRIES;
> +	list->flags = UDMABUF_FLAGS_CLOEXEC;
> +	ubuf_fd = ioctl(devfd, UDMABUF_CREATE_LIST, list);
> +	free(list);
> +	if (ubuf_fd < 0) {
> +		printf("%s: [FAIL, udmabuf-create]\n", TEST_PREFIX);
> +		exit(1);

Same as before.

> +	}
> +
> +	return ubuf_fd;
> +}
> +
> +static void write_to_memfd(void *addr, off64_t size, char chr)
> +{
> +	int i;
> +
> +	for (i = 0; i < size / page_size; i++) {
> +		*((char *)addr + (i * page_size)) = chr;
> +	}
> +}
> +
> +static void *mmap_fd(int fd, off64_t size)
>   {
> -	return syscall(__NR_memfd_create, name, flags);
> +	void *addr;
> +
> +	addr = mmap(NULL, size, PROT_READ|PROT_WRITE, MAP_SHARED, fd, 0);
> +	if (addr == MAP_FAILED) {
> +		printf("%s: ubuf_fd mmap fail\n", TEST_PREFIX);
> +		exit(1);
> +	}
> +
> +	return addr;
> +}
> +
> +static int compare_chunks(void *addr1, void *addr2, off64_t memfd_size)
> +{
> +	off64_t off;
> +	int i = 0, j, k = 0, ret = 0;
> +	char char1, char2;
> +
> +	while (i < NUM_ENTRIES) {
> +		off = i * (memfd_size / NUM_ENTRIES);
> +		for (j = 0; j < NUM_PAGES; j++, k++) {
> +			char1 = *((char *)addr1 + off + (j * getpagesize()));
> +			char2 = *((char *)addr2 + (k * getpagesize()));
> +			if (char1 != char2) {
> +				ret = -1;
> +				goto err;
> +			}
> +		}
> +		i++;
> +	}
> +err:
> +	munmap(addr1, memfd_size);
> +	munmap(addr2, NUM_ENTRIES * NUM_PAGES * getpagesize());
> +	return ret;
>   }
>   
>   int main(int argc, char *argv[])
>   {
>   	struct udmabuf_create create;
>   	int devfd, memfd, buf, ret;
> -	off_t size;
> -	void *mem;
> +	off64_t size;
> +	void *addr1, *addr2;
>   
>   	devfd = open("/dev/udmabuf", O_RDWR);
>   	if (devfd < 0) {
> @@ -90,6 +196,9 @@ int main(int argc, char *argv[])
>   	}
>   
>   	/* should work */
> +	page_size = getpagesize();
> +	addr1 = mmap_fd(memfd, size);
> +	write_to_memfd(addr1, size, 'a');
>   	create.memfd  = memfd;
>   	create.offset = 0;
>   	create.size   = size;
> @@ -98,6 +207,40 @@ int main(int argc, char *argv[])
>   		printf("%s: [FAIL,test-4]\n", TEST_PREFIX);
>   		exit(1);
>   	}
> +	munmap(addr1, size);
> +	close(buf);
> +	close(memfd);
> +
> +	/* should work (migration of 4k size pages)*/
> +	size = MEMFD_SIZE * page_size;
> +	memfd = create_memfd_with_seals(size, false);
> +	addr1 = mmap_fd(memfd, size);
> +	write_to_memfd(addr1, size, 'a');
> +	buf = create_udmabuf_list(devfd, memfd, size);
> +	addr2 = mmap_fd(buf, NUM_PAGES * NUM_ENTRIES * getpagesize());
> +	write_to_memfd(addr1, size, 'b');
> +	ret = compare_chunks(addr1, addr2, size);
> +	if (ret < 0) {
> +		printf("%s: [FAIL,test-5]\n", TEST_PREFIX);
> +		exit(1);
> +	}
> +	close(buf);
> +	close(memfd);
> +
> +	/* should work (migration of 2MB size huge pages)*/
> +	page_size = getpagesize() * 512; /* 2 MB */
> +	size = MEMFD_SIZE * page_size;
> +	memfd = create_memfd_with_seals(size, true);
> +	addr1 = mmap_fd(memfd, size);
> +	write_to_memfd(addr1, size, 'a');
> +	buf = create_udmabuf_list(devfd, memfd, size);
> +	addr2 = mmap_fd(buf, NUM_PAGES * NUM_ENTRIES * getpagesize());
> +	write_to_memfd(addr1, size, 'b');
> +	ret = compare_chunks(addr1, addr2, size);
> +	if (ret < 0) {
> +		printf("%s: [FAIL,test-6]\n", TEST_PREFIX);
> +		exit(1);
> +	}
>   
>   	fprintf(stderr, "%s: ok\n", TEST_PREFIX);
>   	close(buf);


CC linux0kselftest list when you send v2.

thanks,
-- Shuah
